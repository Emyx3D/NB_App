import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/provider/promotion/ad.dart';
import 'package:naijabatternew/widgets/indicator_dot.dart';

class AdvertContentsSlider extends ConsumerStatefulWidget {
  const AdvertContentsSlider({super.key});

  @override
  ConsumerState<AdvertContentsSlider> createState() =>
      _AdvertContentsSliderState();
}

class _AdvertContentsSliderState extends ConsumerState<AdvertContentsSlider> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentIndex);
  }

  // sliderThrough(List data) {
  //   late Timer timer;

  //   timer = Timer.periodic(const Duration(seconds: 10), (timer) {
  //     if (_currentIndex < data.length - 1) {
  //       _currentIndex++;
  //     } else {
  //       _currentIndex = 0;
  //     }
  //     _pageController.animateToPage(
  //       _currentIndex,
  //       duration: const Duration(milliseconds: 350),
  //       curve: Curves.easeOutCubic,
  //     );
  //   });
  // }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Consumer(
      builder: (context, ref, child) {
        final adProvider = ref.watch(ad(4));

        return adProvider.when(
          data: (data) {
            // sliderThrough(data);
            if (data.isEmpty) {
              return const SizedBox();
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    width: screenWidth,
                    height: 60,
                    child: PageView.builder(
                      itemCount: data.length,
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          _currentIndex = value;
                        });
                      },
                      itemBuilder: (context, index) => Image.network(
                        data[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      data.length,
                      (index) => IndicatorDot(
                        isActive: index == _currentIndex,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xCE0F29A9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'AD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.0,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error, stackTrace) => Text('Error occured'),
          loading: () => const Text('Loading...'),
        );
      },
    );
  }
}

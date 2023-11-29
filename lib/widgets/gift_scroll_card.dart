import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/widgets/fields_content.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class GiftScrollCard extends ConsumerStatefulWidget {
  const GiftScrollCard({
    super.key,
    required this.image,
    required this.productName,
    required this.location,
    required this.onPressed,
  });

  final ImageProvider image;
  final String productName;
  final String location;
  // final String price;
  final void Function() onPressed;

  @override
  ConsumerState<GiftScrollCard> createState() => _GiftScrollCardState();
}

class _GiftScrollCardState extends ConsumerState<GiftScrollCard> {
  bool isIconChanged = false;

  void toggleIcon() {
    setState(() {
      isIconChanged = !isIconChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return GestureDetector(
      onTap: widget.onPressed,
      child: Card(
        color: themeIsLight ? Colors.white : const Color(0xFF0B111C),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image(
                      image: widget.image,
                      width: double.infinity,
                      height: 165.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 12.5,
                      color: themeIsLight
                          ? Colors.black
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 70.0,
                      child: Text(
                        widget.location,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                          color: themeIsLight
                              ? const Color(0xB2000000)
                              : ProjectColors.smallTxtWhite,
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 16.0,
                    // ),
                    SizedBox(
                      width: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w300,
                              fontSize: 7.5,
                              color: themeIsLight
                                  ? Colors.black
                                  : const Color(0xB2FFFFFF),
                            ),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            "Free",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              fontSize: 12.0,
                              color: themeIsLight
                                  ? Colors.black
                                  : const Color(0xB2FFFFFF),
                            ),
                          ),
                          const SizedBox10(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                toggleIcon();
                              });
                            },
                            child: Icon(
                              isIconChanged
                                  ? Icons.bookmark_rounded
                                  : Icons.bookmark_border_rounded,
                              size: 20.0,
                              color: const Color(0xFF4074E9),
                            ),
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          // icon: const Icon(
                          //   Icons.bookmark_border_rounded,
                          //   size: 20.0,
                          //   color: Color(0xFF4074E9),
                          // ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/provider/promotion/ad.dart';

class AdvertContent extends StatelessWidget {
  const AdvertContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final adProvider = ref.watch(ad(1));
      return adProvider.when(
        data: (data) {
          if (data.isEmpty) {
            return const SizedBox();
          }

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Image(
                  image: NetworkImage(data[0].image),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(206, 15, 41, 169),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'AD',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.0,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Text('Loading...'),
      );
    });
  }
}

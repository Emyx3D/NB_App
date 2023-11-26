import 'package:flutter/material.dart';

class SweetDealsImageBox extends StatelessWidget {
  const SweetDealsImageBox({
    super.key,
    required this.image,
    required this.productName,
  });

  final ImageProvider image;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: image,
          width: 110,
          height: 115,
          fit: BoxFit.cover,
        ),
        
        Positioned(
          bottom: 0.0,
          child: Container(
            color: const Color(0xB20F28A9),
            width: 110.0,
            height: 22.0,
          ),
        ),
        Positioned(
          bottom: 3.5,
          child: Text(
            productName,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              fontSize: 11.0,
            ),
          ),
        ),
      ],
    );
  }
}

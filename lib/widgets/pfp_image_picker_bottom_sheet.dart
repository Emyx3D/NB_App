import 'package:flutter/material.dart';
import 'package:naijabatternew/utilities/fonts.dart';

class PfpImagePickerBottomSheet extends StatelessWidget {
  const PfpImagePickerBottomSheet({
    super.key,
    required this.pickFromCamera,
    required this.pickFromGallery,
  });

  final void Function() pickFromCamera;
  final void Function() pickFromGallery;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: screenHeight / 5.5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: pickFromGallery,
            child: const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    size: 25,
                  ),
                  Text(
                    "Pick from Gallery",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: interFontName,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: VerticalDivider(color: Colors.grey),
          ),
          GestureDetector(
            onTap: pickFromCamera,
            child: const Padding(
              padding: EdgeInsets.only(right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_rounded,
                    size: 25,
                  ),
                  Text(
                    "Pick from Camera",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: interFontName,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
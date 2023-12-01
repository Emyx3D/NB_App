import 'package:flutter/material.dart';
import 'package:naijabatternew/utilities/fonts.dart';

class HelpScreenTextField extends StatelessWidget {
  const HelpScreenTextField({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: Colors.black,
      style: const TextStyle(
        color: Colors.black,
        fontFamily: interFontName,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontFamily: interFontName,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}

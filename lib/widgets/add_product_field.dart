import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/views/accesibility_page.dart';

class AddProductInputField extends ConsumerWidget {
  const AddProductInputField({
    super.key,
    required this.enableSuggestions,
    required this.autocorrect,
    required this.keyboardType,
    required this.hintText,
    required this.obscureText,
    this.maxLength,
    required this.onChanged,
    required this.onSaved,
    required this.pl,
    required this.pt,
    required this.pr,
    required this.pb,
    required this.ifvalueisNull,
  });
  final bool enableSuggestions;
  final bool autocorrect;
  final bool obscureText;
  final TextInputType keyboardType;
  final String hintText;
  final int? maxLength;
  final void Function(dynamic) onChanged;
  final void Function(dynamic) onSaved;
  final double pl;
  final double pt;
  final double pr;
  final double pb;

  final String ifvalueisNull;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: themeIsLight
          ? const Color(0xFF4054BA)
          : ProjectColors.darkThemeBorderColor,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      maxLength: maxLength,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ifvalueisNull;
        }
        return null;
      },
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeIsLight
                ? const Color(0xFF4054BA)
                : ProjectColors.darkThemeBorderColor,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(13.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeIsLight
                ? const Color(0xFF4054BA)
                : ProjectColors.darkThemeBorderColor,
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(13.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(13.0),
          ),
        ),
        contentPadding: EdgeInsets.only(
          top: pt,
          bottom: pb,
          right: pr,
          left: pl,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: themeIsLight
              ? const Color(0x61000000)
              : ProjectColors.bigTxtWhite,
          fontFamily: "Roboto",
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeIsLight
                ? const Color(0xFF4054BA)
                : ProjectColors.darkThemeBorderColor,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(13.0),
          ),
        ),
      ),
    );
  }
}

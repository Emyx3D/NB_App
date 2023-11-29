import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class DropdownFormButton extends ConsumerWidget {
  const DropdownFormButton({
    super.key,
    required this.list,
    required this.disabledText,
    required this.ifvalueisNull,
    required this.onChanged,
    required this.pl,
    required this.pt,
    required this.pr,
    required this.pb,
    required this.onSaved,
    this.dropdownValue,
  });

  final List<String> list;
  final String disabledText;
  final String ifvalueisNull;
  final void Function(String?) onChanged;
  final void Function(dynamic) onSaved;
  final double pl;
  final double pt;
  final double pr;
  final double pb;
  final String? dropdownValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return DropdownButtonFormField2(
      value: dropdownValue,
      isExpanded: true,
      hint: Text(
        disabledText,
        style: TextStyle(
          fontSize: 14.0,
          color: themeIsLight
              ? const Color(0x61000000)
              : ProjectColors.bigTxtWhite,
          fontFamily: "Roboto",
        ),
      ),
      items: list
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 14.0,
                  color: themeIsLight
                      ? const Color(0xFF000000)
                      : ProjectColors.bigTxtWhite,
                  fontFamily: "Roboto",
                ),
              ),
            ),
          )
          .toList(),
      validator: (value) {
        if (value == null) {
          return ifvalueisNull;
        }
        return null;
      },
      onChanged: onChanged,
      onSaved: onSaved,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: IconStyleData(
        icon: Icon(
          Icons.expand_more_rounded,
          color: themeIsLight ? Colors.black87 : ProjectColors.bigTxtWhite,
          weight: 22,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          top: pt,
          bottom: pb,
          right: pr,
          left: pl,
        ),
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
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(13.0),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class SearchTitle extends ConsumerWidget {
  const SearchTitle({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          color: themeIsLight
              ? const Color(0xB80B1C75)
              : ProjectColors.bigTxtWhite,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          fontSize: 14.5,
        ),
      ),
    );
  }
}

class SearchTab extends ConsumerWidget {
  const SearchTab({
    super.key,
    required this.text,
    required this.onPressed, 
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    // var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: themeIsLight ? const Color(0xFA0857BF) : const Color(0xFF29398C),
        borderRadius: BorderRadius.circular(3.0),
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 9.0),
      padding: const EdgeInsets.only(
        top: 9,
        bottom: 9,
        left: 10,
        right: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: themeIsLight
                    ? const Color(0xF1FFFFFF)
                    : ProjectColors.bigTxtWhite,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              ),
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: onPressed,
            child: Icon(
              Icons.close_rounded,
              size: 15,
              color: themeIsLight
                  ? const Color(0xF1FFFFFF)
                  : ProjectColors.bigTxtWhite,
            ),
          ),
        ],
      ),
    );
  }
}
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
  });
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Container(
      decoration: BoxDecoration(
        color: themeIsLight ? const Color(0xFA0857BF) : const Color(0xFF29398C),
        borderRadius: BorderRadius.circular(3.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 9.0),
      child: Text(
        text,
        style: TextStyle(
          color: themeIsLight
              ? const Color(0xF1FFFFFF)
              : ProjectColors.bigTxtWhite,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 12.0,
        ),
      ),
    );
  }
}

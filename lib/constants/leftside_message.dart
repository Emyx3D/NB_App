import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class LeftSideMessage extends ConsumerWidget {
  const LeftSideMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.65,
        ),
        margin: const EdgeInsets.only(bottom: 15.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: themeIsLight
              ? const Color(0xFFE1EAFF)
              : ProjectColors.darkThemeLeftBubbleColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          message,
          style: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
            color: themeIsLight
                ? const Color(0xFF000000)
                : ProjectColors.bigTxtWhite,
          ),
        ),
      ),
    );
  }
}

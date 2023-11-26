import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class MessageNotification extends ConsumerWidget {
  const MessageNotification({
    super.key,
    required this.notificationMessage,
  });

  final String notificationMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Padding(
      padding: const EdgeInsets.only(bottom: 29.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // width: 23,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: themeIsLight
                    ? const Color(0xFF0F28A9)
                    : const Color(0xFF334496),
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Icon(
                Icons.textsms_rounded,
                color: themeIsLight
                    ? Colors.white
                    : ProjectColors.darkThemeBgColor,
                size: 10.5,
              ),
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            flex: 9,
            child: Text(
              notificationMessage,
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                color: themeIsLight
                    ? const Color(0xFF000000)
                    : ProjectColors.bigTxtWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotdealsNotification extends ConsumerWidget {
  const HotdealsNotification({
    super.key,
    required this.notificationMessage,
  });

  final String notificationMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Padding(
      padding: const EdgeInsets.only(bottom: 29.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // width: 23,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: themeIsLight
                    ? const Color(0xFFCF1920)
                    : const Color(0xFFE44D52),
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Text(
                "Hot",
                style: TextStyle(
                  fontSize: 8.5,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: themeIsLight
                      ? Colors.white
                      : ProjectColors.darkThemeBgColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            flex: 9,
            child: Text(
              notificationMessage,
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                color: themeIsLight
                    ? const Color(0xFF000000)
                    : ProjectColors.bigTxtWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewProductNotification extends ConsumerWidget {
  const NewProductNotification({
    super.key,
    required this.notificationMessage,
  });

  final String notificationMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Padding(
      padding: const EdgeInsets.only(bottom: 29.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // width: 23,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: themeIsLight
                    ? const Color(0xFF1EE90D)
                    : const Color(0xB53B9633),
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Text(
                "New",
                style: TextStyle(
                  fontSize: 8.5,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: themeIsLight
                      ? Colors.white
                      : ProjectColors.darkThemeBgColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            flex: 9,
            child: Text(
              notificationMessage,
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                color: themeIsLight
                    ? const Color(0xFF000000)
                    : ProjectColors.bigTxtWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

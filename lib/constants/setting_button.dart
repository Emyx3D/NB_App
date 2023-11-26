import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class SettingsButton extends ConsumerWidget {
  const SettingsButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // margin: const EdgeInsets.only(
        //   bottom: 25,
        // ),
        padding: const EdgeInsets.symmetric(vertical: 13),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 14.91,
                  child: FaIcon(
                    icon,
                    size: 12,
                    color:
                        themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 14.91, right: 6),
                  width: 1.0,
                  height: 16.0, // Adjust the height as needed
                  color: themeIsLight
                      ? Colors.black
                      : ProjectColors.bigTxtWhite, // Set the color of the line
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: themeIsLight
                        ? const Color(0xFF000000)
                        : ProjectColors.bigTxtWhite,
                  ),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 16.0,
              color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            ),
          ],
        ),
      ),
    );
  }
}

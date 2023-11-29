// Widget for the back button
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/views/accesibility_page.dart';

class PreviousPageIcon extends ConsumerWidget {
  const PreviousPageIcon({super.key, this.onPressed});
  final void Function()? onPressed;

  // @override
  // Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 28.0,
            color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
          ),
        ),
      ),
    );
  }
}

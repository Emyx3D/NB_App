import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class FixedPreviousPageIconHeader extends ConsumerWidget
    implements PreferredSizeWidget {
  const FixedPreviousPageIconHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Card(
      color: themeIsLight ? Colors.white : ProjectColors.darkThemeBgColor,
      margin: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 30.0,
                color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
              ),
            )),
      ),
    );
  }
}

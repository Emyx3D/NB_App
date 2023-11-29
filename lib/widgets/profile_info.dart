import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/widgets/fields_content.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class ProfileInfos extends ConsumerWidget {
  const ProfileInfos({
    super.key,
    required this.title,
    required this.total,
  });

  final String title;
  final int total;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300,
            color: themeIsLight
                ? const Color(0xFF000000)
                : ProjectColors.bigTxtWhite,
          ),
          // textAlign: TextAlign.center,
        ),
        const SizedBox12(),
        Text(
          total.toString(),
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            color: themeIsLight
                ? const Color(0xFF000000)
                : ProjectColors.bigTxtWhite,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/fields_content.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';
import '../views/homepage_view.dart';

class SettingsSubPageWidget extends ConsumerWidget {
  const SettingsSubPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Row(
      children: [
        PreviousPageIcon(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'Accessbility',
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

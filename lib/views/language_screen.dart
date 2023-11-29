import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/fonts.dart';
import 'package:naijabatternew/views/accesibility_page.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';

enum Languages { english }

class LanguageScreen extends ConsumerStatefulWidget {
  const LanguageScreen({super.key});

  @override
  ConsumerState<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends ConsumerState<LanguageScreen> {
  Languages _language = Languages.english;

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    return Scaffold(
      appBar: AppBar(
        leading: PreviousPageIcon(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Language',
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
            color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            fontSize: 18,
          ),
        ),
        titleSpacing: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "English",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: robotoFontName,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 15,
                  height: 0,
                  child: Radio<Languages>(
                    activeColor: ProjectColors.mainBlue,
                    value: Languages.english,
                    groupValue: _language,
                    splashRadius: 0,
                    onChanged: (Languages? value) {
                      setState(() {
                        _language = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            // ListTile(
            //   title: const Text('Dog'),
            //   leading: Radio<Pet>(
            //     value: Pet.dog,
            //     groupValue: _pet,
            //     onChanged: (Pet? value) {
            //       setState(() {
            //         _pet = value!;
            //       });
            //     },
            //   ),
            // ),
            // ListTile(
            //   title: const Text('Cart'),
            //   leading: Radio<Pet>(
            //     value: Pet.cat,
            //     groupValue: _pet,
            //     onChanged: (Pet? value) {
            //       setState(() {
            //         _pet = value!;
            //       });
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

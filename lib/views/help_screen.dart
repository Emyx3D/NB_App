import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/fonts.dart';
import 'package:naijabatternew/views/accesibility_page.dart';
import 'package:naijabatternew/widgets/fields_content.dart';
import 'package:naijabatternew/widgets/helpscreen_textfield.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';

class HelpScreen extends ConsumerWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Scaffold(
      appBar: AppBar(
        leading: PreviousPageIcon(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Help',
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
            Expanded(
              child: Column(
                children: [
                  const HelpScreenTextField(hintText: "Name"),
                  const SizedBox15(),
                  const HelpScreenTextField(hintText: "E-mail"),
                  const SizedBox15(),
                  const HelpScreenTextField(hintText: "Phone Number"),
                  const SizedBox15(),
                  TextField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    maxLines: 6,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: interFontName,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Description",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: interFontName,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  const SizedBox10(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(
                            0xFF0694D5,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Send Enquiry",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: nunitoFontName,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  RichText(
                    text: const TextSpan(
                      text: "Or call our helpline ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: interFontName,
                        fontSize: 11,
                      ),
                      children: [
                        TextSpan(
                          text: "+234 916 582 5643",
                          style: TextStyle(
                            color: Color(0xFF0694D5),
                            fontWeight: FontWeight.w600,
                            fontFamily: interFontName,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  RichText(
                    text: const TextSpan(
                      text: "Email ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: interFontName,
                        fontSize: 11,
                      ),
                      children: [
                        TextSpan(
                          text: "support@naijabarter.com",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: interFontName,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

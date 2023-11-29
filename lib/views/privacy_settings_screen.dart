import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/fonts.dart';
import 'package:naijabatternew/views/accesibility_page.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';

class PrivacySettingsScreen extends ConsumerStatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  ConsumerState<PrivacySettingsScreen> createState() =>
      _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends ConsumerState<PrivacySettingsScreen> {
  bool seprSwitchValue = false;
  bool styocoSwitchValue = false;
  bool usyoacSwitchValue = false;
  bool auuscedaSwitchValue = false;

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
          'Privacy & Data',
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
            color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            fontSize: 18,
          ),
        ),
        titleSpacing: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Search privacy",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: robotoFontName,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Hide your search history",
                          style: TextStyle(
                            color: ProjectColors.darkThemeBorderColor,
                            fontFamily: robotoFontName,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: .8,
                    child: Switch.adaptive(
                      inactiveThumbColor: ProjectColors.darkThemeBorderColor,
                      activeTrackColor: ProjectColors.mainBlue,
                      value: seprSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          seprSwitchValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Store your contacts",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: robotoFontName,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Allow access to contacts",
                          style: TextStyle(
                            color: ProjectColors.darkThemeBorderColor,
                            fontFamily: robotoFontName,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: .8,
                    child: Switch.adaptive(
                      inactiveThumbColor: ProjectColors.darkThemeBorderColor,
                      activeTrackColor: ProjectColors.mainBlue,
                      value: styocoSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          styocoSwitchValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Use your activities",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: robotoFontName,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Improving advertisements for you about the application on other sites that you may visit",
                          style: TextStyle(
                            color: ProjectColors.darkThemeBorderColor,
                            fontFamily: robotoFontName,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: .8,
                    child: Switch.adaptive(
                      inactiveThumbColor: ProjectColors.darkThemeBorderColor,
                      activeTrackColor: ProjectColors.mainBlue,
                      value: usyoacSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          usyoacSwitchValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "Automatically use cellular data",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: robotoFontName,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Transform.scale(
                    scale: .8,
                    child: Switch.adaptive(
                      inactiveThumbColor: ProjectColors.darkThemeBorderColor,
                      activeTrackColor: ProjectColors.mainBlue,
                      value: auuscedaSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          auuscedaSwitchValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Clear app cache",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: robotoFontName,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

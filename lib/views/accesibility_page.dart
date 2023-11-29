import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../brain/provider.dart';
import '../widgets/dialog_box_stuff.dart';
import '../widgets/fields_content.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';
import '../widgets/lists.dart';
import '../utilities/colors.dart';
import '../views/homepage_view.dart';

// final themeProvider = StateProvider<bool>((ref) => true);

const bool themeProviderState = true;

// final themeProvider = StateProvider<bool>((ref) => themeProviderState);

final themeProvider = StateProvider<bool>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider); // Create this provider
  return prefs.getBool('themeState') ??
      true; // Load the theme state from SharedPreferences
});

// final themeName = StateProvider<String>((ref) => "Light");

final themeName = StateProvider<String>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider); // Create this provider
  return prefs.getString('themeName') ??
      "Light"; // Load the theme name from SharedPreferences
});

class AccessibilityView extends ConsumerStatefulWidget {
  const AccessibilityView({
    super.key,
  });

  @override
  ConsumerState<AccessibilityView> createState() => _AccessibilityViewState();
}

class _AccessibilityViewState extends ConsumerState<AccessibilityView> {
  String valueTHEME = "Light";
  String valueFONTSIZE = fontsizeOptions[1];
  // late String finalTheme = ref.read(themeName.notifier).state;

  void handleClickListItemFONTSIZE() async {
    final newValue = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialogRaw(
          title: 'Font Size',
          options: fontsizeOptions,
          onClose: (newValue) {
            Navigator.of(context).pop(newValue);
          },
          value: valueFONTSIZE,
        );
      },
    );

    if (newValue != null) {
      setState(() {
        valueFONTSIZE = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    // bool isLightTheme = ref.watch(themeProvider);

    // void handleClickListItemTHEME() async {
    //   final newValue = await showDialog<String>(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return ConfirmationDialogRaw(
    //         title: 'Theme',
    //         options: themeOptions,
    //         onClose: (newValue) {
    //           valueTHEME = newValue;
    //           Navigator.of(context).pop(newValue);
    //         },
    //         // value: ref.read(themeName.notifier).state,
    //         value: ref.watch(themeName.notifier).state,
    //       );
    //     },
    //   );

    //   if (newValue != null) {
    //     setState(() {
    //       valueTHEME = newValue;
    //     });

    //     if (valueTHEME == "Light") {
    //       // ref.read(themeProvider.notifier).state = true;
    //       // ref.read(themeName.notifier).state = "Light";
    //       ref.watch(themeProvider.notifier).state = true;
    //       // themeProviderState = true;
    //       ref.watch(themeName.notifier).state = "Light";
    //     } else {
    //       // ref.read(themeProvider.notifier).state = false;
    //       // ref.read(themeName.notifier).state = "Dark";
    //       ref.watch(themeProvider.notifier).state = false;
    //       // themeProviderState = false;
    //       ref.watch(themeName.notifier).state = "Dark";
    //     }

    //     // print(ref.read(themeProvider.notifier).state);
    //     // print(ref.read(themeName.notifier).state);
    //   }
    // }

    void handleClickListItemTHEME() async {
      final newValue = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return ConfirmationDialogRaw(
            title: 'Theme',
            options: themeOptions,
            onClose: (newValue) {
              valueTHEME = newValue;
              Navigator.of(context).pop(newValue);
            },
            value: ref.watch(themeName.notifier).state,
          );
        },
      );

      if (newValue != null) {
        setState(() {
          valueTHEME = newValue;
        });

        if (valueTHEME == "Light") {
          ref.watch(themeProvider.notifier).state = true;
          ref.watch(themeName.notifier).state = "Light";
        } else {
          ref.watch(themeProvider.notifier).state = false;
          ref.watch(themeName.notifier).state = "Dark";
        }

        // Save the theme state to SharedPreferences
        final prefs = ref.read(sharedPreferencesProvider);
        prefs.setBool('themeState', ref.read(themeProvider.notifier).state);
        prefs.setString('themeName', ref.read(themeName.notifier).state);
      }
    }

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ),
          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: PreviousPageIcon(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ),
                (route) => false,
              );
            },
          ),
          title: Text(
            'Accessbility',
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
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // const SettingsSubPageWidget(),

              const SizedBox19(),

              // ListTile(
              //   title: const Text('Interruptions'),
              //   enabled: false,
              //   onTap: null,
              //   tileColor: Colors.grey[300],
              // ),
              ListTile(
                title: const Text('Theme'),
                subtitle: Text(ref.watch(themeName.notifier).state),
                onTap: handleClickListItemTHEME,
              ),
              ListTile(
                title: const Text('Font Size'),
                subtitle: Text(valueFONTSIZE),
                onTap: handleClickListItemFONTSIZE,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:adaptive_dialog/adaptive_dialog.dart';
// import 'package:flutter/material.dart';
// import '../constants/fields_content.dart'; import 'package:naijabatternew/constants/previous_page_icon.dart';
// import '../constants/lists.dart';
// import '../constants/settings_subpage_widget.dart';

// class AccessibilityView extends StatefulWidget {
//   const AccessibilityView({super.key});

//   @override
//   State<AccessibilityView> createState() => _AccessibilityViewState();
// }

// class _AccessibilityViewState extends State<AccessibilityView> {
//   @override
//   Widget build(BuildContext context) {
//     String theme;

//     dynamic dialogBox() {
//       showConfirmationDialog(
//         context: context,
//         title: "Theme",
//         actions: themeOptions,
//         initialSelectedActionKey: themeOptions[0].key,
//         onWillPop: false,
//       );
//       return showConfirmationDialog;
//     }

//     Widget showSubtitle() {
//       Widget subtitleWidget = Text(themeOptions[0].label);
//       return subtitleWidget;
//     }

//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               const SettingsSubPageWidget(),
//               const SizedBox19(),
//               ListTile(
//                   title: const Text('Theme'),
//                   subtitle: showSubtitle(),
//                   onTap: () {
//                     dialogBox();
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/brain/provider.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/themes/themes.dart';
import 'package:naijabatternew/views/accesibility_page.dart';
import 'package:naijabatternew/views/loading_page.dart';
import 'package:naijabatternew/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final themeProvider = StateProvider<bool>((ref) => true);

// final themeName = StateProvider<String>((ref) => "Light");

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }
late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Naija Barter',
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      // theme: ThemeData(
      //   primaryColor: const Color(0xFF0F28A9),
      // ),
      theme: isLightTheme
          ? ThemeData.light().copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: ProjectColors.mainBlue,
              ),
            )
          : TAppTheme.darkTheme,
      // theme: TAppTheme.darkTheme,
      // darkTheme: TAppTheme.darkTheme,
      // themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      // home: const HomePage(),
      // home: const LoginView(),
      home: const LoadingPage(),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}


    // ThemeData darkTheme = ThemeData(
    //   primaryColor: const Color(0xFF0F28A9),
    //   buttonTheme: const ButtonThemeData(
    //     buttonColor: Color(0xFF0F28A9),
    //   ),
    //   inputDecorationTheme: const InputDecorationTheme(
    //     fillColor: Color(0xFF06090F), // Change input field background color
    //     hintStyle: TextStyle(
    //       color: Color(0xD1FFFFFF), // Change hint text color
    //     ),
    //     outlineBorder: BorderSide(
    //       color: Color(0xFF6C7396),
    //     ),
    //   ),
    //   cardTheme: const CardTheme(
    //     color: Color(0xFF06090F),
    //   ),
    //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //     backgroundColor: Color(0xFF0A0F1A),
    //   ),
    //   scaffoldBackgroundColor: const Color(0xFF06090F),
    //   textTheme: const TextTheme(
    //     bodySmall: TextStyle(
    //       color: Color(0xD1FFFFFF),
    //     ),
    //     bodyMedium: TextStyle(
    //       color: Color(0xD1FFFFFF),
    //     ),
    //     bodyLarge: TextStyle(
    //       color: Color(0xD1FFFFFF),
    //     ),
    //   ),
    // );

    // ThemeData darkTheme = ThemeData(
    //   primaryColor: Colors.blueAccent, // Change the primary color
    //   scaffoldBackgroundColor: Colors.grey[900], // Change the background color
    //   appBarTheme: AppBarTheme(
    //     color: Colors.grey[900], // Change the app bar color
    //   ),
    //   textTheme: const TextTheme(
    //     // Change text styles for various elements
    //     bodySmall: TextStyle(
    //       color: Colors.white, // Change headline text color
    //       fontSize: 24.0, // Change headline font size
    //       fontWeight: FontWeight.bold,
    //     ),
    //     bodyMedium: TextStyle(
    //       color: Colors.white70, // Change body text color
    //       fontSize: 16.0, // Change body text font size
    //     ),
    //   ),
    //   buttonTheme: ButtonThemeData(
    //     buttonColor: Colors.blueAccent, // Change button color
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(8.0), // Change button shape
    //     ),
    //   ),
    //   // Define other theme properties like input decoration, card theme, etc.
    //   inputDecorationTheme: InputDecorationTheme(
    //     fillColor: Colors.grey[800], // Change input field background color
    //     hintStyle: const TextStyle(
    //       color: Colors.white70, // Change hint text color
    //     ),
    //   ),
    //   cardTheme: CardTheme(
    //     color: Colors.grey[800], // Change card color
    //     elevation: 4.0, // Change card elevation
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12.0), // Change card shape
    //     ),
    //   ),
    // );

    // ThemeData darkTheme = ThemeData(
    //   brightness: Brightness.dark, // Set the brightness to dark
    //   primaryColor: Colors.blueGrey[900],
    //   scaffoldBackgroundColor: Colors.blueGrey[
    //       800], // Set the scaffold background color to a slightly lighter blue-grey
    //   textTheme: const TextTheme(
    //     // Set the text theme
    //     displayLarge: TextStyle(
    //         fontSize: 32.0,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white), // Set the headline1 style
    //     displayMedium: TextStyle(
    //         fontSize: 24.0,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white), // Set the headline2 style
    //     displaySmall: TextStyle(
    //         fontSize: 20.0,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white), // Set the headline3 style
    //     bodyLarge: TextStyle(
    //         fontSize: 16.0, color: Colors.white), // Set the bodyText1 style
    //     bodyMedium: TextStyle(
    //         fontSize: 14.0, color: Colors.white), // Set the bodyText2 style
    //     titleMedium: TextStyle(
    //         fontSize: 18.0, color: Colors.white), // Set the subtitle1 style
    //     titleSmall: TextStyle(
    //         fontSize: 16.0, color: Colors.white), // Set the subtitle2 style
    //     bodySmall: TextStyle(
    //         fontSize: 12.0, color: Colors.white), // Set the caption style
    //     labelLarge: TextStyle(
    //         fontSize: 16.0,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white), // Set the button style
    //   ),
    //   buttonTheme: ButtonThemeData(
    //     // Set the button theme
    //     shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(
    //             8.0)), // Set the button shape to rounded rectangle
    //     buttonColor:
    //         Colors.tealAccent[400], // Set the button color to the accent color
    //     textTheme:
    //         ButtonTextTheme.primary, // Set the button text theme to primary
    //   ),
    //   iconTheme: const IconThemeData(
    //     // Set the icon theme
    //     color: Colors.white, // Set the icon color to white
    //     size: 24.0, // Set the icon size to 24.0
    //   ),
    // );
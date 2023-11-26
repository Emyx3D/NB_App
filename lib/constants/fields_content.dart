import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

// Widget for the Form Input Fields
class InputField extends ConsumerWidget {
  const InputField(
      {super.key,
      required this.enableSuggestions,
      required this.autocorrect,
      required this.keyboardType,
      required this.hintText,
      required this.obscureText,
      this.maxLength});
  final bool enableSuggestions;
  final bool autocorrect;
  final bool obscureText;
  final TextInputType keyboardType;
  final String hintText;
  final int? maxLength;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: themeIsLight
          ? const Color(0xFF4054BA)
          : ProjectColors.darkThemeBorderColor,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      maxLength: maxLength,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeIsLight
                ? const Color(0xFF4054BA)
                : ProjectColors.darkThemeBorderColor,
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(13.0),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 20.0,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: themeIsLight
              ? const Color(0x61000000)
              : ProjectColors.bigTxtWhite,
          fontFamily: "Roboto",
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeIsLight
                ? const Color(0xFF4054BA)
                : ProjectColors.darkThemeBorderColor,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(13.0),
          ),
        ),
      ),
    );
  }
}

// Widget for the Headers of the Forms
class FormHeaderText extends StatelessWidget {
  const FormHeaderText({
    super.key,
    required this.textInput,
    required this.color,
  });
  final String textInput;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      textInput,
      style: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
        decoration: TextDecoration.none,
        color: color,
      ),
    );
  }
}

// Widget for the text at the bottom of every Form eg: "Don't have an account? Sign Up"
class BottomInputRow extends ConsumerWidget {
  const BottomInputRow({
    super.key,
    required this.blackText,
    required this.buttonText,
    this.onPressed,
  });
  final String blackText;
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Row(
      children: [
        Text(
          blackText,
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 15.0,
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Text(
              buttonText,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: themeIsLight
                    ? const Color(0xFF0F28A9)
                    : ProjectColors.darkThemeBorderColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// SizedBox with a height of 28
class SizedBox28 extends StatelessWidget {
  const SizedBox28({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 28.0,
    );
  }
}

// SizedBox with a height of 19
class SizedBox19 extends StatelessWidget {
  const SizedBox19({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 19.0,
    );
  }
}

// SizedBox with a height of 15
class SizedBox15 extends StatelessWidget {
  const SizedBox15({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 15.0,
    );
  }
}

class SizedBox12 extends StatelessWidget {
  const SizedBox12({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 12.0,
    );
  }
}

class SizedBox10 extends StatelessWidget {
  const SizedBox10({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10.0,
    );
  }
}

class SizedBox34 extends StatelessWidget {
  const SizedBox34({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 34.0,
    );
  }
}

class SizedBox26 extends StatelessWidget {
  const SizedBox26({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 26.0,
    );
  }
}

class SizedBox165 extends StatelessWidget {
  const SizedBox165({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 165.0,
    );
  }
}

// Widget for the big blue Form Button
class InputFieldButton extends StatelessWidget {
  const InputFieldButton({super.key, required this.buttonText, this.onPressed});
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    // final themeIsLight = ref.watch(themeProvider.notifier).state;

    return SizedBox(
      width: double.infinity,
      height: 59.0,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color(0xFF0F28A9),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontFamily: "Roboto",
            color: Colors.white,
            fontWeight: FontWeight.w700,
            // backgroundColor: Color(0xFF0F28A9),
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

// Widget for the back button
class PreviousPageIcon extends ConsumerWidget {
  const PreviousPageIcon({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10.0),
        child: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 30.0,
            color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
          ),
        ),
      ),
    );
  }
}

const descTextStyle = TextStyle(
  fontSize: 18.0,
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w700,
  color: Color(0xFF333434),
);

const buttonTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w700,
  color: Color(0xFFFFFFFF),
);

Color kActiveColorBlue = const Color(0xFF0F28A9);
Color kActiveColorRed = const Color(0xFFCF1920);
Color kInactiveColor = const Color(0xFF000000);

Color homebtnColor = kActiveColorBlue;
Color searchbtnColor = kInactiveColor;
Color hotdealsbtnColor = kInactiveColor;
Color profilebtnColor = kInactiveColor;
bool homebtnVisible = true;
bool searchbtnVisible = false;
bool hotdealsbtnVisible = false;
bool profilebtnVisible = false;

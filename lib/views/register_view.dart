import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/fields_content.dart';
import '../utilities/colors.dart';
import '../utilities/forms/forms_collection.dart';
import '../views/accesibility_page.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  bool showPersonalForm = true;
  bool showBusinessForm = false;

  Color topLeftRowBgColor = const Color(0xFF0F28A9);
  Color topRightRowBgColor = Colors.grey.shade200;
  Color topLeftRowTextColor = const Color(0xFFFFFFFF);
  Color topRightRowTextColor = const Color(0xFF000000);

  void togglePersonalForm() {
    setState(() {
      showPersonalForm = true;
      showBusinessForm = false;
      topLeftRowTextColor = const Color(0xFFFFFFFF);
      topRightRowBgColor = Colors.grey.shade200;
      topRightRowTextColor = const Color(0xFF000000);
      topLeftRowBgColor = const Color(0xFF0F28A9);
    });
  }

  void toggleBusinessForm() {
    setState(() {
      showPersonalForm = false;
      showBusinessForm = true;
      topLeftRowBgColor = Colors.grey.shade200;
      topRightRowBgColor = const Color(0xFF0F28A9);
      topLeftRowTextColor = const Color(0xFF000000);
      topRightRowTextColor = const Color(0xFFFFFFFF);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: screenHeight - keyboardHeight,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FormHeaderText(
                          textInput: 'Create Account',
                          color: themeIsLight
                              ? Colors.black
                              : ProjectColors.bigTxtWhite,
                        ),
                        const SizedBox26(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50.0,
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(3.0),
                                            bottomLeft: Radius.circular(3.0),
                                            topRight: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0)),
                                      ),
                                    ),
                                    side: MaterialStateProperty.all(
                                      const BorderSide(
                                        width: 1.0,
                                        color: Color(0xFF0F28A9),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      topLeftRowBgColor,
                                    ),
                                  ),
                                  onPressed: togglePersonalForm,
                                  child: Text(
                                    'Personal',
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: topLeftRowTextColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50.0,
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0.0),
                                          bottomLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(3.0),
                                          bottomRight: Radius.circular(3.0),
                                        ),
                                      ),
                                    ),
                                    side: MaterialStateProperty.all(
                                      const BorderSide(
                                        width: 1.0,
                                        color: Color(0xFF0F28A9),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      topRightRowBgColor,
                                    ),
                                  ),
                                  onPressed: toggleBusinessForm,
                                  child: Text(
                                    'Business',
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: topRightRowTextColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox19(),
                        if (showPersonalForm) const PersonalForm(),
                        if (showBusinessForm) const BusinessForm(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/fields_content.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';

class DeclutterUpgradePage extends StatelessWidget {
  const DeclutterUpgradePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              PreviousPageIcon(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 53.0,
              ),
              const Center(
                child: Text(
                  "Card details",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              const SizedBox19(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Card Number',
                            style: TextStyle(
                              fontSize: 8.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextFormField(
                          cursorColor: const Color(0xFF4054BA),
                          enableSuggestions: false,
                          autocorrect: false,
                          // maxLength: 15,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF4054BA),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.0),
                              ),
                            ),
                            hintText: '123456789234566',
                            hintStyle: TextStyle(
                              fontSize: 14.0,
                              color: Color(0x61000000),
                              fontFamily: "Roboto",
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 11,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF4054BA),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox10(),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Expiry Date',
                                  style: TextStyle(
                                    fontSize: 8.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              TextFormField(
                                cursorColor: const Color(0xFF4054BA),
                                enableSuggestions: false,
                                autocorrect: false,
                                // maxLength: 15,
                                keyboardType: TextInputType.datetime,
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF4054BA),
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.0),
                                    ),
                                  ),
                                  hintText: 'MM/YY',
                                  hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0x61000000),
                                    fontFamily: "Roboto",
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 11,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF4054BA),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'CVV',
                                  style: TextStyle(
                                    fontSize: 8.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              TextFormField(
                                cursorColor: const Color(0xFF4054BA),
                                enableSuggestions: false,
                                autocorrect: false,
                                // maxLength: 15,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF4054BA),
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.0),
                                    ),
                                  ),
                                  hintText: '123',
                                  hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0x61000000),
                                    fontFamily: "Roboto",
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 11,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF4054BA),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 41.0,
              ),
              SizedBox(
                width: 230,
                height: 42,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    // padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 245,),),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF0F28A9),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 58.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 125.0,
                    height: 1.0,
                    color: const Color(0xFF555151),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  const Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF555151),
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Container(
                    width: 125.0,
                    height: 1.0,
                    color: const Color(0xFF555151),
                  ),
                ],
              ),
              const SizedBox(
                height: 38.0,
              ),
              SizedBox(
                width: 230,
                height: 42,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: const Color(0xFF0F28A9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      // padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 245,),),
                      // backgroundColor: MaterialStateProperty.all(
                      //   const Color(0xFFFFFFFF),
                      // ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.paypal,
                          color: Color(0xFF0F28A9),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'PayPal',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0F28A9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox15(),
              SizedBox(
                width: 230,
                height: 42,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: const Color(0xFF0F28A9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      // padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 245,),),
                      // backgroundColor: MaterialStateProperty.all(
                      //   const Color(0xFFFFFFFF),
                      // ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/googleicon.png',
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        const Text(
                          'Pay',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                            color: Color(0xBF000000),
                          ),
                        ),
                      ],
                    ),
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

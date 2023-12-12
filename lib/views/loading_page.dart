import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:naijabatternew/utilities/provider/auth/auth.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    isLoggedIn(context);
    super.initState();
  }
  // void redirect() {
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //     return const HomePage();
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Color(0xFF0F28A9),
          size: 50.0,
        ),
      ),
    );
  }
}

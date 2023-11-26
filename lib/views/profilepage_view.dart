import 'package:flutter/material.dart';
import '../constants/business_profile_view.dart';

int totalNumberOfGifts = 20;
int totalNumberOfDeclutter = 14;
int totalNumberOfBarter = 9;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BusinessProfileView(),
          // child: PersonalProfileView(),
          // PersonalProfileView(),
        ),
      ),
    );
  }
}

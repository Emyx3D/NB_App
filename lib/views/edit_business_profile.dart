import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/fields_content.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';
import '../widgets/profile_info.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';
import '../views/profilepage_view.dart';

class EditBusinessProfilePage extends ConsumerWidget {
  const EditBusinessProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PreviousPageIcon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        color: themeIsLight
                            ? Colors.black
                            : ProjectColors.bigTxtWhite,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w800,
                          color: themeIsLight
                              ? const Color(0xFF0F28A9)
                              : const Color(0xFF373972),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox34(),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: themeIsLight
                            ? const Color(0xFF0F28A9)
                            : const Color(0xFF373972),
                        width: 1.0,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 80.0,
                      backgroundImage: AssetImage('images/gojo.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 24,
                    child: Icon(
                      Icons.photo_camera,
                      color: themeIsLight
                          ? const Color(0xFF0F28A9)
                          : const Color(0xFF373972),
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox12(),
              Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color:
                      themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
                ),
              ),
              const SizedBox(
                height: 9.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileInfos(
                    title: 'Gift',
                    total: totalNumberOfGifts,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35.0),
                    width: 1.0,
                    height: 65.0, // Adjust the height as needed
                    color:
                        themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
                  ),
                  ProfileInfos(
                    title: 'Declutter',
                    total: totalNumberOfDeclutter,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35.0),
                    width: 1.0,
                    height: 65.0, // Adjust the height as needed
                    color:
                        themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
                  ),
                  ProfileInfos(
                    title: 'Barter',
                    total: totalNumberOfBarter,
                  ),
                ],
              ),
              const SizedBox(
                height: 28.0,
              ),
              const EditProfileInfoRow(
                title: "Name:",
                userInfoValue: "Gojo Satoru",
              ),
              const SizedBox19(),
              const EditProfileInfoRow(
                title: "Location:",
                userInfoValue: "Lagos, Nigeria",
              ),
              const SizedBox19(),
              const EditProfileInfoRow(
                title: "DOB:",
                userInfoValue: "12/06/2002",
              ),
              const SizedBox19(),
              const EditProfileInfoRow(
                title: "E-mail:",
                userInfoValue: "Melpeters@bartar.com",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileInfoRow extends ConsumerWidget {
  const EditProfileInfoRow({
    super.key,
    required this.title,
    required this.userInfoValue,
  });

  final String title;
  final String userInfoValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
              color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          SizedBox(
            width: 250.0,
            child: Text(
              userInfoValue,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}

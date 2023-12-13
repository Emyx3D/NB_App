import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/provider/auth/auth.dart';
import 'package:naijabatternew/utilities/provider/user/user.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';

import '../utilities/colors.dart';
import '../views/accesibility_page.dart';
import '../widgets/fields_content.dart';
import '../widgets/profile_info.dart';

class EditBusinessProfilePage extends ConsumerStatefulWidget {
  const EditBusinessProfilePage({super.key});

  @override
  ConsumerState<EditBusinessProfilePage> createState() =>
      _EditBusinessProfilePageState();
}

class _EditBusinessProfilePageState
    extends ConsumerState<EditBusinessProfilePage> {
  final TextEditingController userNameController =
      TextEditingController(text: getUserOrNa().name);
  final TextEditingController locationController =
      TextEditingController(text: getUserOrNa().location);
  final TextEditingController dobController =
      TextEditingController(text: getUserOrNa().dob);
  final TextEditingController emailController =
      TextEditingController(text: getUserOrNa().email);

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PreviousPageIcon(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    color:
                        themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 0.0),
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
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
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
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundImage: NetworkImage(getUserOrNa().image),
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
              Consumer(
                builder: (context, ref, child) {
                  final userProductCountProvider = ref.watch(userProductCount);

                  return userProductCountProvider.when(
                    data: (data) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProfileInfos(
                          title: 'Gift',
                          total: data['gift'] ?? 0,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 35.0),
                          width: 1.0,
                          height: 65.0, // Adjust the height as needed
                          color: themeIsLight
                              ? Colors.black
                              : ProjectColors
                                  .bigTxtWhite, // Set the color of the line
                        ),
                        ProfileInfos(
                          title: 'Declutter',
                          total: data['declutter'] ?? 0,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 35.0),
                          width: 1.0,
                          height: 65.0, // Adjust the height as needed
                          color: themeIsLight
                              ? Colors.black
                              : ProjectColors.bigTxtWhite,
                        ),
                        ProfileInfos(
                          title: 'Barter',
                          total: data['barter'] ?? 0,
                        )
                      ],
                    ),
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => const Text('Loading...'),
                  );
                },
              ),
              const SizedBox(
                height: 28.0,
              ),
              EditProfileInfoColumn(
                title: "Name:",
                userInfoValue: getUserOrNa().name,
                controller: userNameController,
              ),
              const SizedBox19(),
              EditProfileInfoColumn(
                title: "Location:",
                userInfoValue: getUserOrNa().location,
                controller: locationController,
              ),
              const SizedBox19(),
              EditProfileInfoColumn(
                title: "DOB:",
                userInfoValue: getUserOrNa().dob, //"12/06/2002"
                controller: dobController,
              ),
              const SizedBox19(),
              EditProfileInfoColumn(
                title: "E-mail:",
                userInfoValue: getUserOrNa().email,
                controller: emailController,
              ),
              const SizedBox28(),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileInfoColumn extends ConsumerWidget {
  const EditProfileInfoColumn({
    super.key,
    required this.title,
    required this.userInfoValue,
    required this.controller,
  });

  final String title;
  final String userInfoValue;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              height: 5.0,
            ),
            // SizedBox(
            //   // width: 250.0,
            //   child: Text(
            //     userInfoValue,
            //     maxLines: 1,
            //     overflow: TextOverflow.ellipsis,
            //     textAlign: TextAlign.end,
            //     style: TextStyle(
            //       fontSize: 16.0,
            //       fontFamily: 'Roboto',
            //       fontWeight: FontWeight.w400,
            //       color:
            //           themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            //     ),
            //   ),
            // ),
            SizedBox(
              child: TextField(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

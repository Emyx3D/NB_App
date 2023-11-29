import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';
import '../widgets/notifications_collection.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';
import '../views/homepage_view.dart';
import '../views/messages_page_view.dart';

class NotificationsPageView extends ConsumerWidget {
  const NotificationsPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
          ),
          (route) => false,
        );
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor:
                themeIsLight ? Colors.white : ProjectColors.darkThemeBgColor,
            leading: PreviousPageIcon(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const HomePage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  ),
                  (route) => false,
                );
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const MessagesView(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                      ),
                    );
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.solidPaperPlane,
                    size: 20,
                    color:
                        themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 9.0,
              ),
              Center(
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    color: themeIsLight
                        ? const Color(0xFF000000)
                        : ProjectColors.bigTxtWhite,
                  ),
                ),
              ),
              const SizedBox(
                height: 26.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  children: [
                    NewProductNotification(
                      notificationMessage:
                          "New Product Alert! Check out our latest addition to the store. Get it before it's gone!",
                    ),
                    NewProductNotification(
                      notificationMessage:
                          "New Product Alert! Check out our latest addition to the store. Get it before it's gone!",
                    ),
                    NewProductNotification(
                      notificationMessage:
                          "New Product Alert! Check out our latest addition to the store. Get it before it's gone!",
                    ),
                    HotdealsNotification(
                      notificationMessage:
                          "Exclusive Discount for our loyal followers: Enjoy 20% off on all purchases for the next 24 hours",
                    ),
                    NewProductNotification(
                      notificationMessage:
                          "New Product Alert! Check out our latest addition to the store. Get it before it's gone!",
                    ),
                    NewProductNotification(
                      notificationMessage:
                          "New Product Alert! Check out our latest addition to the store. Get it before it's gone!",
                    ),
                    MessageNotification(
                      notificationMessage: "New Message from Emma Johnson",
                    ),
                    HotdealsNotification(
                      notificationMessage:
                          "Exclusive Discount for our loyal followers: Enjoy 20% off on all purchases for the next 24 hours",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

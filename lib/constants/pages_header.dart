import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../views/messages_page_view.dart';
import '../views/notifications_page_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class PagesHeader extends ConsumerWidget implements PreferredSizeWidget {
  const PagesHeader({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Container(
      color: themeIsLight ? Colors.white : ProjectColors.darkThemeBgColor,
      padding: const EdgeInsets.only(
        top: 35.0,
        right: 20.0,
        left: 20.0,
        bottom: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: Icon(
              Icons.notifications,
              size: 25,
              color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const NotificationsPageView(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return child;
                  },
                ),
              );
            },
          ),
          const Image(
            image: AssetImage('images/nblogo.png'),
            width: 65.0,
          ),
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: FaIcon(
              FontAwesomeIcons.solidPaperPlane,
              size: 20,
              color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            ),
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
          ),
        ],
      ),
    );
  }
}

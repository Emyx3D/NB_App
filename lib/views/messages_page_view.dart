import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/fields_content.dart';
import '../constants/message_box.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';
import '../views/chat_screen.dart';
import '../views/homepage_view.dart';
import '../views/notifications_page_view.dart';

class MessagesView extends ConsumerWidget {
  const MessagesView({super.key});

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
          backgroundColor:
              themeIsLight ? Colors.white : ProjectColors.darkThemeBgColor,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PreviousPageIcon(
                      onPressed: () {
                        // Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const HomePage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return child;
                            },
                          ),
                          (route) => false,
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, right: 10),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const NotificationsPageView(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return child;
                                },
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.notifications,
                            size: 25,
                            color: themeIsLight
                                ? Colors.black
                                : ProjectColors.bigTxtWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 29.0,
                ),
                Center(
                  child: Text(
                    'Messages',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const ChatScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const Duration(microseconds: 100);
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(1.0, 0.0),
                                    end: Offset.zero,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves
                                          .easeInOut, // You can choose a different curve if needed
                                      reverseCurve: Curves
                                          .easeInOut, // You can choose a different reverse curve if needed
                                    ),
                                  ),
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: const MessageBox(
                          profileImage: AssetImage('images/cutleryimg.jpg'),
                          // NetworkImage(
                          //   'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVvcGxlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                          // ),
                          userName: 'Emma Johnson',
                          messagePreview:
                              "Your order is on the way bro, don't fret",
                          time: '11:30 am',
                          noOfMessages: 2,
                        ),
                      ),
                      const MessageBox(
                        profileImage: AssetImage('images/gojo.png'),
                        // NetworkImage(
                        //   'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVvcGxlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                        // ),
                        userName: 'Evelyn Moore',
                        messagePreview: "Just wanted to say hi!",
                        time: '1:30 pm',
                        noOfMessages: 2,
                      ),
                      const MessageBox(
                        profileImage: AssetImage('images/gojo.png'),
                        // NetworkImage(
                        //   'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGVvcGxlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                        // ),
                        userName: 'Benjamin Wilson',
                        messagePreview:
                            "I'm stuck in traffic, going to be a bit late.",
                        time: '7:30 am',
                        noOfMessages: 1,
                      ),
                      const MessageBox(
                        profileImage: AssetImage('images/gojo.png'),
                        // NetworkImage(
                        //   'https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
                        // ),
                        userName: 'Henry Martin',
                        messagePreview: "Can't wait to see you!",
                        time: '08:10 am',
                        noOfMessages: 400,
                      ),
                      const MessageBox(
                        profileImage: AssetImage('images/gojo.png'),
                        // NetworkImage(
                        //   'https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
                        // ),
                        userName:
                            'Alexander Anderson yubbbbiuuuuuuuuuuuhkmmjjkgtvvvvvvvvvvvv',
                        messagePreview:
                            "I'm feeling a bit under the weather today.",
                        time: '4:03 pm',
                        noOfMessages: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/fields_content.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

enum SampleItem { itemOne, itemTwo }

class ChatScreenHeader extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100.0);
  const ChatScreenHeader({
    super.key,
    required this.userName,
    required this.profilePicture,
  });

  final String userName;
  final ImageProvider profilePicture;

  @override
  ConsumerState<ChatScreenHeader> createState() => _ChatScreenHeaderState();
}

class _ChatScreenHeaderState extends ConsumerState<ChatScreenHeader> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Card(
      color: themeIsLight ? Colors.white : ProjectColors.darkThemeBgColor,
      margin: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 11,
                bottom: 20,
              ),
              child: PreviousPageIcon(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Padding(
            // alignment: Alignment.center,
            padding: const EdgeInsets.only(
              top: 32,
              bottom: 20,
              // right: 25,
            ),
            child: Center(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: widget.profilePicture,
                  ),
                  const SizedBox(
                    width: 9.0,
                  ),
                  Text(
                    widget.userName,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  bottom: 20,
                  right: 15,
                ),
                child: PopupMenuButton<SampleItem>(
                  color: themeIsLight
                      ? Colors.white
                      : ProjectColors.darkThemeBgColor,
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: themeIsLight
                        ? const Color(0xFF000000)
                        : ProjectColors.bigTxtWhite,
                  ),
                  iconSize: 30.0,
                  initialValue: selectedMenu,
                  // Callback that sets the selected popup menu item.
                  onSelected: (SampleItem item) {
                    setState(() {
                      selectedMenu = item;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text('Clear chat'),
                    ),
                    PopupMenuItem<SampleItem>(
                      onTap: () {
                        Future.delayed(Duration.zero, () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: const Color(0xFFDEECFF),
                                  icon: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.close,
                                        size: 22.0,
                                        color: Color(0xFF0F28A9),
                                      ),
                                    ),
                                  ),
                                  iconPadding: const EdgeInsets.only(
                                    bottom: 5.0,
                                    right: 16.0,
                                    top: 16.0,
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Padding(
                                      //   padding: EdgeInsets.symmetric(
                                      //       horizontal: 40.0),
                                      //   child: Text(
                                      //     "Select an exchange item from your barter or upload a barter to proceed",
                                      //     textAlign: TextAlign.center,
                                      //     style: TextStyle(
                                      //       fontSize: 13.0,
                                      //       fontFamily: 'Inter',
                                      //       fontWeight: FontWeight.w300,
                                      //       color: Color(0xFF000000),
                                      //     ),
                                      //   ),
                                      // ),
                                      const TextField(
                                        decoration: InputDecoration(
                                          hintText: "What's your complaint?",
                                          hintStyle: TextStyle(
                                            fontSize: 13.0,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xFF000000),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(
                                                0xFF0F28A9,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 35.0,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 35.0,
                                        child: TextButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              const Color(
                                                0xFF0F28A9,
                                              ),
                                            ),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ),
                                          child: const Text(
                                            "Submit",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        });
                      },
                      value: SampleItem.itemTwo,
                      child: Text(
                        'Report account',
                        style: TextStyle(
                          color: themeIsLight
                              ? const Color(0xFFE81515)
                              : const Color(0xFF962A2A),
                        ),
                      ),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Report account'),
                    // ),
                  ],
                ),
                // IconButton(
                //   padding: const EdgeInsets.all(0),
                // icon: const Icon(
                //   Icons.more_vert_rounded,
                //   size: 30.0,
                // ),
                //   onPressed: () {
                //     showCustomPopupMenu(context);
                //   },
                // ),
              ),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
        ],
      ),
    );
  }
}

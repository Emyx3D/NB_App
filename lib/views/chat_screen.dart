import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/chat_screen_header.dart';
import '../widgets/lists.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key, this.productName});

  final String? productName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    final ScrollController scrollController = ScrollController();

    String controllerText() {
      if (productName != null) {
        return "Product to be bartered: $productName";
      } else {
        return "";
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: const ChatScreenHeader(
          userName: "Emma Johnson",
          profilePicture: AssetImage('images/cutleryimg.jpg'),
        ),
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 26.0,
                  right: 26.0,
                  bottom: 77.0,
                  // top: 26.0,
                ),
                child: ListView.builder(
                  controller: scrollController,
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final reversedIndex = messages.length - 1 - index;
                    return messages[reversedIndex];
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
                left: 5,
                right: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextField(
                        controller: TextEditingController(
                          text: controllerText(),
                        ),
                        minLines: 1,
                        maxLines: 2,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          filled: false,
                          // fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB0BBF4),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFB0BBF4),
                              width: 1.0,
                            ),
                          ),
                          hintText: "Type a message",
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                            color: themeIsLight
                                ? const Color(0xB0000000)
                                : ProjectColors.bigTxtWhite,
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 25.0,
                            top: 20,
                            bottom: 20,
                          ),
                          suffixIcon: const ChatScreenSuffixIconRow(),
                          suffixIconConstraints: BoxConstraints.tight(
                            const Size(100, 40),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFB0BBF4),
                          ),
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                        ),
                        child: IconButton(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                            left: 15,
                            right: 15,
                          ),
                          icon: const Icon(Icons.send_rounded),
                          iconSize: 27.0,
                          color: const Color(0xFF0F28A9),
                          onPressed: () {
                            // send message logic
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScreenSuffixIconRow extends StatelessWidget {
  const ChatScreenSuffixIconRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            print("hey1");
          },
          child: const Icon(
            Icons.keyboard_voice_rounded,
            size: 22.0,
            color: Color(0xFF618FFA),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {
            print("hey2");
          },
          child: const Icon(
            Icons.attach_file_rounded,
            size: 22.0,
            color: Color(0xFF618FFA),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {
            print("hey3");
          },
          child: const Icon(
            Icons.add_reaction_rounded,
            size: 22.0,
            color: Color(0xFF618FFA),
          ),
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.keyboard_voice_rounded),
        //   iconSize: 20.0,
        //   color: const Color(0xFF618FFA),
        // ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.attach_file_rounded),
        //   iconSize: 20.0,
        //   color: const Color(0xFF618FFA),
        // ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.add_reaction_rounded,
        //   ),
        //   iconSize: 20.0,
        //   color: const Color(0xFF618FFA),
        // ),
      ],
    );
  }
}

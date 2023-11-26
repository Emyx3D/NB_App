import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class MessageBox extends ConsumerWidget {
  const MessageBox({
    super.key,
    required this.profileImage,
    required this.userName,
    this.messagePreview,
    required this.time,
    required this.noOfMessages,
  });

  final ImageProvider profileImage;
  final String userName;
  final dynamic messagePreview;
  final String time;
  final int noOfMessages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(
        bottom: 9.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0),
                child: Image(
                  image: profileImage,
                  fit: BoxFit.cover,
                  width: 56.0,
                  height: 55.0,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                height: 42,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 220,
                      child: Text(
                        userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: themeIsLight
                              ? const Color(0xFF000000)
                              : ProjectColors.bigTxtWhite,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 220,
                      child: Text(
                        messagePreview,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                          color: themeIsLight
                              ? const Color(0xFF000000)
                              : ProjectColors.bigTxtWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: themeIsLight
                        ? const Color(0xFF000000)
                        : ProjectColors.bigTxtWhite,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  // width: 16.0,
                  // height: 16.0,
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: themeIsLight
                        ? const Color(0xFF618FFA)
                        : const Color(0xFF687696),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    noOfMessages.toString(),
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : const Color(0xFF161616),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

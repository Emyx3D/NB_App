import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/fields_content.dart';
import '../widgets/fixed_previouspage_icon.dart';
import '../widgets/promotepage_products_grid.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class ListedItemsforPromotePage extends ConsumerStatefulWidget {
  const ListedItemsforPromotePage({super.key, required this.pageName});

  final String pageName;

  @override
  ConsumerState<ListedItemsforPromotePage> createState() =>
      _ListedItemsforPromotePageState();
}

class _ListedItemsforPromotePageState
    extends ConsumerState<ListedItemsforPromotePage> {
  late bool themeIsLight;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    themeIsLight = ref.watch(themeProvider.notifier).state;
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            if (widget.pageName == "hotdeals") {
              return AlertDialog(
                // icon: const Align(
                //   alignment: Alignment.centerLeft,
                //   child: Icon(
                //     Icons.close,
                //     size: 10.0,
                //   ),
                // ),
                title: const Text(
                  'Notice',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF0F28A9),
                    fontSize: 16.0,
                    fontFamily: "Roboto",
                  ),
                ),
                content: Text(
                  "Hot deals will be up for a maximum of 48 hours",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                    color: themeIsLight
                        ? const Color(0xFF000000)
                        : ProjectColors.bigTxtWhite,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Color(0xFF0F28A9),
                      ),
                    ),
                  ),
                ],
              );
            } else if (widget.pageName == "flashsale") {
              return AlertDialog(
                // icon: const Align(
                //   alignment: Alignment.centerLeft,
                //   child: Icon(
                //     Icons.close,
                //     size: 10.0,
                //   ),
                // ),
                title: const Text(
                  'Notice',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF0F28A9),
                    fontSize: 16.0,
                    fontFamily: "Roboto",
                  ),
                ),
                content: Text(
                  "Flash sale will be up for a maximum of 10 minutes",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                    color: themeIsLight
                        ? const Color(0xFF000000)
                        : ProjectColors.bigTxtWhite,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        // color: themeIsLight
                        //     ? const Color(0xFF0F28A9)
                        //     : const Color(0xFF373972),
                        color: Color(0xFF0F28A9),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Text("null");
          });
    });
  }

  // Future<void> _showPopup() async {
  //   await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Popup Title'),
  //         content: const Text('This is the popup content.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Close the popup
  //             },
  //             child: const Text('Close'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // final themeIsLight = ref.watch(themeProvider.notifier).state;

    return SafeArea(
      child: Scaffold(
        appBar: const FixedPreviousPageIconHeader(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 24.0,
              ),
              Text(
                "Listed Items",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: themeIsLight
                      ? const Color(0xFF000000)
                      : ProjectColors.bigTxtWhite,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                "Click on the item below to activate your promotion",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  color: themeIsLight
                      ? const Color(0xFF000000)
                      : ProjectColors.bigTxtWhite,
                ),
              ),
              const SizedBox12(),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: promoteProductsGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








              // GridView.count(
              //   shrinkWrap: true,
              //   crossAxisCount: 2,
              //   children: const [
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //   ],
              // ),



              // Row(
              //   children: [
              //     Expanded(
              //       child: Card(
              //         color: Colors.white,
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(5.0),
              //           ),
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Center(
              //                 child: ClipRRect(
              //                   borderRadius: BorderRadius.circular(5.0),
              //                   child: const Image(
              //                     image: AssetImage("images/umbrella.jpg"),
              //                     // width: double.maxFinite,
              //                     // height: 150,
              //                     fit: BoxFit.cover,
              //                   ),
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 10.0,
              //               ),
              //               const Text(
              //                 "Umbrella jhriuruuuuuuuuuuuuuuuuuuuuuuuui4444fu4ugf4iuf4ufgi4gfugfiufgiufi4ugfufgugffg4ufg4iugfu5",
              //                 maxLines: 1,
              //                 overflow: TextOverflow.ellipsis,
              //                 style: TextStyle(
              //                   fontFamily: 'Nunito',
              //                   fontWeight: FontWeight.w700,
              //                   fontSize: 12.5,
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 5.0,
              //               ),
              //               const Text(
              //                 "Lagos",
              //                 style: TextStyle(
              //                   fontFamily: 'Nunito',
              //                   fontWeight: FontWeight.w500,
              //                   fontSize: 9,
              //                   color: Color(0xB2000000),
              //                 ),
              //               ),
              //               const Align(
              //                 alignment: Alignment.centerRight,
              //                 child: Text(
              //                   "Barter",
              //                   maxLines: 1,
              //                   overflow: TextOverflow.ellipsis,
              //                   textAlign: TextAlign.right,
              //                   style: TextStyle(
              //                     fontFamily: 'Nunito',
              //                     fontWeight: FontWeight.w700,
              //                     fontSize: 12.0,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: Card(
              //         color: Colors.white,
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(5.0),
              //           ),
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Center(
              //                 child: ClipRRect(
              //                   borderRadius: BorderRadius.circular(5.0),
              //                   child: const Image(
              //                     image: AssetImage("images/umbrella.jpg"),
              //                     // width: double.maxFinite,
              //                     height: 150,
              //                     fit: BoxFit.cover,
              //                   ),
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 10.0,
              //               ),
              //               const Text(
              //                 "Umbrella jhriuruuuuuuuuuuuuuuuuuuuuuuuui4444fu4ugf4iuf4ufgi4gfugfiufgiufi4ugfufgugffg4ufg4iugfu5",
              //                 maxLines: 1,
              //                 overflow: TextOverflow.ellipsis,
              //                 style: TextStyle(
              //                   fontFamily: 'Nunito',
              //                   fontWeight: FontWeight.w700,
              //                   fontSize: 12.5,
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 5.0,
              //               ),
              //               const Text(
              //                 "Lagos",
              //                 style: TextStyle(
              //                   fontFamily: 'Nunito',
              //                   fontWeight: FontWeight.w500,
              //                   fontSize: 9,
              //                   color: Color(0xB2000000),
              //                 ),
              //               ),
              //               const Align(
              //                 alignment: Alignment.centerRight,
              //                 child: Text(
              //                   "Barter",
              //                   maxLines: 1,
              //                   overflow: TextOverflow.ellipsis,
              //                   textAlign: TextAlign.right,
              //                   style: TextStyle(
              //                     fontFamily: 'Nunito',
              //                     fontWeight: FontWeight.w700,
              //                     fontSize: 12.0,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
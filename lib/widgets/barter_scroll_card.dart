// import 'package:flutter/material.dart';

// class BarterScrollCard extends StatelessWidget {
//   const BarterScrollCard({
//     super.key,
//     required this.image,
//     required this.productName,
//     required this.location,
//     required this.expectedExchange,
//   });

//   final ImageProvider image;
//   final String productName;
//   final String location;
//   final String expectedExchange;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(5.0),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SizedBox(
//           width: 290.0,
//           height: 100.0,
//           child: Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(5.0),
//                 child: Image(
//                   image: image,
//                   width: 93.0,
//                   height: 121.0,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(
//                 width: 10.0,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: 170.0,
//                     child: Text(
//                       productName,
//                       style: const TextStyle(
//                         fontFamily: 'Nunito',
//                         fontWeight: FontWeight.w700,
//                         fontSize: 12.5,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 170.0,
//                     child: Text(
//                       location,
//                       style: const TextStyle(
//                         fontFamily: 'Nunito',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 9,
//                         color: Color(0xB2000000),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 16.0,
//                   ),
//                   const Text(
//                     'Expected Exchange',
//                     style: TextStyle(
//                       fontFamily: 'Nunito',
//                       fontWeight: FontWeight.w300,
//                       fontSize: 7.5,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 170.0,
//                     child: Text(
//                       expectedExchange,
//                       style: const TextStyle(
//                         fontFamily: 'Nunito',
//                         fontWeight: FontWeight.w700,
//                         fontSize: 12.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/widgets/fields_content.dart';

import '../views/accesibility_page.dart';

class BarterScrollCard extends ConsumerStatefulWidget {
  const BarterScrollCard({
    super.key,
    required this.image,
    required this.productName,
    required this.location,
    required this.expectedExchange,
    required this.onPressed,
  });

  final ImageProvider image;
  final String productName;
  final String location;
  final String expectedExchange;
  final void Function() onPressed;

  @override
  ConsumerState<BarterScrollCard> createState() => _BarterScrollCardState();
}

class _BarterScrollCardState extends ConsumerState<BarterScrollCard> {
  // final String type = 'Barter';
  bool isIconChanged = false;

  void toggleIcon() {
    setState(() {
      isIconChanged = !isIconChanged;

      print("heyyyyyy");
    });
  }

  @override
  Widget build(BuildContext context) {
// IconData icon = Icons.bookmark_border_rounded;

    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return GestureDetector(
      onTap: widget.onPressed,
      child: Card(
        // color: Colors.white,
        color: themeIsLight ? Colors.white : const Color(0xFF0B111C),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image(
                      image: widget.image,
                      width: double.infinity,
                      height: 165.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 12.5,
                      color:
                          themeIsLight ? Colors.black : const Color(0xD1FFFFFF),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 70.0,
                      child: Text(
                        widget.location,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                          color: themeIsLight
                              ? const Color(0xB2000000)
                              : const Color(0xB2FFFFFF),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 16.0,
                    // ),
                    SizedBox(
                      width: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Expected Exchange',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w300,
                              fontSize: 7.5,
                              color: themeIsLight
                                  ? Colors.black
                                  : const Color(0xB2FFFFFF),
                            ),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            widget.expectedExchange,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              fontSize: 12.0,
                              color: themeIsLight
                                  ? Colors.black
                                  : const Color(0xD1FFFFFF),
                            ),
                          ),
                          const SizedBox10(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                toggleIcon();
                              });
                            },
                            child: Icon(
                              isIconChanged
                                  ? Icons.bookmark_rounded
                                  : Icons.bookmark_border_rounded,
                              size: 20.0,
                              color: const Color(0xFF4074E9),
                            ),
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          // icon: const Icon(
                          //   Icons.bookmark_border_rounded,
                          //   size: 20.0,
                          //   color: Color(0xFF4074E9),
                          // ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}










// import 'package:flutter/material.dart';
// import '../constants/fields_content.dart'; import 'package:naijabatternew/constants/previous_page_icon.dart';

// class BarterScrollCard extends StatelessWidget {
//   const BarterScrollCard({
//     super.key,
//     required this.image,
//     required this.productName,
//     required this.location,
//     required this.expectedExchange,
//   });

//   final ImageProvider image;
//   final String productName;
//   final String location;
//   final String expectedExchange;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(5.0),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SizedBox(
//           // width: 200.0,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(5.0),
//                   child: Image(
//                     image: image,
//                     width: double.infinity,
//                     height: 200.0,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: Text(
//                   productName,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontFamily: 'Nunito',
//                     fontWeight: FontWeight.w700,
//                     fontSize: 12.5,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: 70.0,
//                     child: Text(
//                       location,
//                       style: const TextStyle(
//                         fontFamily: 'Nunito',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 9,
//                         color: Color(0xB2000000),
//                       ),
//                     ),
//                   ),
//                   // const SizedBox(
//                   //   width: 16.0,
//                   // ),
//                   SizedBox(
//                     width: 100.0,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         const Text(
//                           'Expected Exchange',
//                           style: TextStyle(
//                             fontFamily: 'Nunito',
//                             fontWeight: FontWeight.w300,
//                             fontSize: 7.5,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 3.0,
//                         ),
//                         Text(
//                           expectedExchange,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.right,
//                           style: const TextStyle(
//                             fontFamily: 'Nunito',
//                             fontWeight: FontWeight.w700,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// }
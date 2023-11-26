import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';
import '../views/promotion_success_page.dart';

class PromotePageProductCard extends ConsumerStatefulWidget {
  const PromotePageProductCard({
    super.key,
    required this.image,
    required this.productName,
    required this.productLocation,
    required this.productType,
  });

  final ImageProvider image;
  final String productName;
  final String productLocation;
  final String productType;

  @override
  ConsumerState<PromotePageProductCard> createState() =>
      _PromotePageProductCardState();
}

class _PromotePageProductCardState
    extends ConsumerState<PromotePageProductCard> {
  late bool themeIsLight;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    themeIsLight = ref.watch(themeProvider.notifier).state;
  }

  void onPressed() {
    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
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
                  fontSize: 15.0,
                  fontFamily: "Roboto",
                ),
              ),
              content: Text(
                "Are you sure you want to promote this item?",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                  color: themeIsLight
                      ? const Color(0xFF000000)
                      : ProjectColors.bigTxtWhite,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color(0xFF0F28A9),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const PromotionSuccessPage();
                    }));
                  },
                  child: const Text(
                    'Sure',
                    style: TextStyle(
                      color: Color(0xFF0F28A9),
                    ),
                  ),
                ),
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final themeIsLight = ref.watch(themeProvider.notifier).state;

//     double? sbHeight;

// if (eeisVisible == true) {
//   sbHeight = 0.0;
// }
// else{
//   sbHeight = 8.0;
// }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: themeIsLight
              ? Colors.white
              : ProjectColors
                  .darkThemeCardColor, // You can set the container color here
          borderRadius: BorderRadius.circular(
              2.0), // Optional: To add rounded corners to the container
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000), // Shadow color
              blurRadius: 4, // Spread of the shadow from the container
              spreadRadius:
                  0, // Optional: How far the shadow extends from the box (negative values will shrink the shadow)
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(2.0),
                  child: Image(
                    image: widget.image,
                    width: 100.0,
                    height: 83.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 100.0,
                  child: Text(
                    widget.productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                  child: Text(
                    widget.productLocation,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 8.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w500,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.smallTxtWhite,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.productType,
                style: TextStyle(
                  fontSize: 9.0,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                  color: themeIsLight
                      ? const Color(0xFF000000)
                      : ProjectColors.bigTxtWhite,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

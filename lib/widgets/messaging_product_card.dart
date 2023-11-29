import 'package:flutter/material.dart';
import '../views/listed_item_product_description.dart';

class MessagingProductCard extends StatelessWidget {
  const MessagingProductCard({
    super.key,
    required this.image,
    required this.productName,
    required this.productLocation,
    required this.productType,
    required this.productDescription,
    this.expectedExchange,
    this.price,
  });

  final ImageProvider image;
  final String productName;
  final String productLocation;
  final String productType;
  final String productDescription;
  final String? expectedExchange;
  final String? price;

  @override
  Widget build(BuildContext context) {
//     double? sbHeight;

// if (eeisVisible == true) {
//   sbHeight = 0.0;
// }
// else{
//   sbHeight = 8.0;
// }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ListedItemsProductDescriptionView(
                image: image,
                productName: productName,
                location: productLocation,
                productDescription: productDescription,
                productType: productType,
                expectedExchange: expectedExchange,
                price: price,
              );
            },
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white, // You can set the container color here
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
                    image: image,
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
                    productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                  child: Text(
                    productLocation,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 8.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w500,
                      color: Color(0xB2000000),
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
                productType,
                style: const TextStyle(
                  fontSize: 9.0,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
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
}

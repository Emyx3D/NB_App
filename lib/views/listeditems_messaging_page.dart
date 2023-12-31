import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/provider/product/product.dart';
import 'package:naijabatternew/widgets/empty.dart';

import '../widgets/fields_content.dart';
import '../widgets/fixed_previouspage_icon.dart';
import '../widgets/messaging_products_grid.dart';

class ListedItemsforMessaging extends StatelessWidget {
  const ListedItemsforMessaging({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: FixedPreviousPageIconHeader(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListIsNotNull(),
        ),
      ),
    );
  }
}

class ListIsNull extends StatelessWidget {
  const ListIsNull({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24.0,
        ),
        const Text(
          "Listed Items",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            color: Color(0xFF000000),
          ),
        ),
        const SizedBox(
          height: 45.0,
        ),
        const Image(
          image: AssetImage(
            "images/emptylist_illustration.png",
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.0),
          child: Text(
            "You have no available uploaded barter, kindly click below to upload a barter to continue.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
              color: Color(0xFF000000),
            ),
          ),
        ),
        const SizedBox(
          height: 99.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
            alignment: Alignment.center,
            height: 49.0,
            decoration: BoxDecoration(
              color: const Color(0xFF0F28A9),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Upload",
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ListIsNotNull extends ConsumerStatefulWidget {
  const ListIsNotNull({
    super.key,
  });

  @override
  ConsumerState<ListIsNotNull> createState() => _ListIsNotNullState();
}

class _ListIsNotNullState extends ConsumerState<ListIsNotNull> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(userProduct);
    final loadingUserProductProvider = ref.watch(loadingUserProduct);

    return Column(
      children: [
        const SizedBox(
          height: 24.0,
        ),
        const Text(
          "Listed Items",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            color: Color(0xFF000000),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Text(
          "Click on the item below to activate your promotion",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300,
            color: Color(0xFF000000),
          ),
        ),
        const SizedBox12(),
        FutureBuilder(
          future: products,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: ProjectColors.errorColor,
                ),
              );
            }
            if (snapshot.data.isEmpty) {
              return const EmptyCard();
            }
            return Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: messagingProductsGrid(snapshot.data, context),
                ),
                const SizedBox10(),
                loadingUserProductProvider
                    ? const SizedBox()
                    : InkWell(
                        onTap: () => ref.read(userProduct.notifier).fetchMore(),
                        child: const Text('more'),
                      ),
                const SizedBox10(),
                loadingUserProductProvider
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircularProgressIndicator(
                            color: ProjectColors.errorColor,
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

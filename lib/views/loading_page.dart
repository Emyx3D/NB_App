import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:naijabatternew/utilities/provider/auth/auth.dart';
import 'package:naijabatternew/utilities/provider/category_and_location/category_and_location.dart';
import 'package:naijabatternew/utilities/provider/other/bookmark.dart';
import 'package:naijabatternew/utilities/provider/other/searchHistory.dart';
import 'package:naijabatternew/utilities/provider/product/product.dart';
import 'package:naijabatternew/utilities/provider/user/user.dart';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({super.key});

  @override
  ConsumerState<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  @override
  void initState() {
    isLoggedIn(context);
    super.initState();
  }
  // void redirect() {
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //     return const HomePage();
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    ref.watch(barterProduct);
    ref.watch(giftProduct);
    ref.watch(declutterProduct);
    ref.watch(bookmark);

    ref.watch(userProduct);
    ref.watch(searchHistory);
    ref.watch(hotDealsProduct);
    ref.watch(userProductCount);
    ref.watch(location);
    ref.watch(category);

    return const Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Color(0xFF0F28A9),
          size: 50.0,
        ),
      ),
    );
  }
}

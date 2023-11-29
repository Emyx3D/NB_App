import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/advert_content.dart';
import '../widgets/barter_scroll_card.dart';
import '../widgets/declutter_scroll_card.dart';
import '../widgets/fields_content.dart';
import '../widgets/flash_sales_card.dart';
import '../widgets/gift_scroll_card.dart';
import '../widgets/pages_header.dart';
import '../views/accesibility_page.dart';
import '../views/more_product_description.dart';

class HomePageView extends ConsumerStatefulWidget {
  const HomePageView({
    super.key,
  });

  @override
  ConsumerState<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends ConsumerState<HomePageView> {
  // final _currentPageNotifier = ValueNotifier<int>(0);
  // final List<Widget> _pages = <Widget>[
  //   Container(color: Colors.blue),
  //   Container(color: Colors.indigo),
  //   Container(color: Colors.green),
  // ];

  // final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    final titleStyle = TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: themeIsLight ? Colors.black : const Color(0xD1FFFFFF),
    );

    return Scaffold(
      appBar: const PagesHeader(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // const PagesHeader(),
            const SizedBox(
              height: 14.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 11.0,
              ),
              // padding: const EdgeInsets.only(left: 11.0, right: 11.0,), //remove the right later
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Barter',
                      style: titleStyle,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        children: [
                          BarterScrollCard(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ProductDescriptionView(
                                  image: AssetImage('images/chairimage.jpg'),
                                  productName: 'Mid-Century Modern Chair',
                                  location: 'Enugu',
                                  expectedExchange: 'Mac Pro Max',
                                  productDescription:
                                      "Crafted with meticulous attention to detail, this chair showcases clean lines, gentle curves, and a minimalist yet impactful silhouette that effortlessly complements a range of interior styles. The carefully selected materials, including rich hardwoods and premium upholstery, not only ensure durability but also lend a sense of sophistication to any space.",
                                );
                              }));
                            },
                            image: const AssetImage('images/chairimage.jpg'),
                            productName: 'Mid-Century Modern Chair',
                            location: 'Enugu',
                            expectedExchange: 'Mac Pro Max',
                          ),
                          BarterScrollCard(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ProductDescriptionView(
                                  image: AssetImage('images/cutleryimg.jpg'),
                                  productName: 'Silverware Set',
                                  location: "Abia",
                                  expectedExchange: 'iPhone 15 Max',
                                  productDescription:
                                      "Elevate your dining experience with this exquisite silverware set. Crafted from high-quality stainless steel, each piece boasts a timeless design that adds a touch of sophistication to any meal. The set includes forks, knives, and spoons, all perfectly balanced for comfortable handling. Whether it's a casual family dinner or a formal gathering, this set brings both style and functionality to your table.",
                                );
                              }));
                            },
                            image: const AssetImage('images/cutleryimg.jpg'),
                            productName: 'Silverware Set',
                            location: "Abia",
                            expectedExchange: 'iPhone 15 Max',
                          ),
                          BarterScrollCard(
                            image: const AssetImage('images/chandelier.jpg'),
                            productName: 'Crystal Chandelier',
                            location: "Anambra",
                            expectedExchange: 'Pixa Pro',
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ProductDescriptionView(
                                  image: AssetImage('images/chandelier.jpg'),
                                  productName: 'Crystal Chandelier',
                                  location: "Anambra",
                                  expectedExchange: 'iPhone 15 Max',
                                  productDescription:
                                      "A crystal chandelier, the embodiment of timeless beauty and sophistication, captivates with its radiant elegance. Crafted with precision and adorned with meticulously cut crystals, it exudes opulence and charm in various styles, from classic to contemporary. Regardless of the design, it shares the ability to refract and reflect light, transforming any space with its mesmerizing play of prismatic colors and shadows. Beyond its aesthetic appeal, it signifies prestige and elegance, making it a coveted addition to luxurious interiors. In essence, a crystal chandelier is a radiant masterpiece that elevates ambiance and leaves an indelible mark of refined beauty.",
                                );
                              }));
                            },
                          ),
                          BarterScrollCard(
                            image: const AssetImage('images/dinnerware.jpg'),
                            productName: 'Antique China Dinnerware',
                            location: "FCT - Abuja",
                            expectedExchange: 'Old Books',
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ProductDescriptionView(
                                  image: AssetImage('images/dinnerware.jpg'),
                                  productName: 'Antique China Dinnerware',
                                  location: "FCT - Abuja",
                                  expectedExchange: 'Old Books',
                                  productDescription:
                                      "Antique china dinnerware embodies an ageless elegance that transcends time. These exquisite dining sets, often adorned with intricate patterns and delicate craftsmanship, exude a sense of history and refinement. Available in a variety of styles, from traditional to Art Deco, antique china dinnerware collections feature exquisite designs that evoke a sense of nostalgia and sophistication. Each piece is a testament to the craftsmanship of bygone eras.",
                                );
                              }));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  // BarterScrollCard(
                  //   image: AssetImage('images/chairimage.jpg'),
                  //   productName: 'Mid-Century Modern Chair',
                  //   location: 'Lagos',
                  //   expectedExchange: 'Mac Pro Max',
                  // ),
                  // BarterScrollCard(
                  //   image: AssetImage('images/cutleryimg.jpg'),
                  //   productName: 'Silverware Set',
                  //   location: 'Lagos',
                  //   expectedExchange: 'iPhone 15 Max',
                  // ),
                ],
              ),
            ),
            // const SizedBox15(),
            const AdvertContent(),
            const SizedBox12(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.0),
              child: BarterFlashSaleCard(
                image: AssetImage('images/heels.jpg'),
                productName: "Fridda de laba Gucci Pumps 6 inches",
                location: "Lagos",
                expectedExchange: "Hermes Bag",
              ),
            ),

            // const SizedBox(
            //   height: 11.0,
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 42.0,
            //   alignment: Alignment.center,
            //   color: const Color(0xFF0857BF),
            //   child: const Text(
            //     'Sweet Deals',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 16.0,
            //       fontWeight: FontWeight.w600,
            //       fontFamily: 'Nunito',
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 2.0,
            // ),
            // Container(
            //   child: homepageStackProductsGrid(),
            // ),

            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 11.0,
              ),
              // padding: const EdgeInsets.only(left: 11.0, right: 11.0,), //remove the right later
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Declutter',
                      style: titleStyle,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        children: [
                          DeclutterScrollCard(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ProductDescriptionView(
                                  image: AssetImage('images/chair2.jpg'),
                                  productName:
                                      "Mid-Century Modern Chair 2023 Model",
                                  location: "Imo",
                                  price: '₦51,500',
                                  productDescription:
                                      "Crafted with meticulous attention to detail, this chair showcases clean lines, gentle curves, and a minimalist yet impactful silhouette that effortlessly complements a range of interior styles. The carefully selected materials, including rich hardwoods and premium upholstery, not only ensure durability but also lend a sense of sophistication to any space.",
                                );
                              }));
                            },
                            image: const AssetImage('images/chair2.jpg'),
                            productName: 'Mid-Century Modern Chair 2023 Model',
                            location: "Imo",
                            price: '₦51,500',
                          ),
                          DeclutterScrollCard(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ProductDescriptionView(
                                  image: AssetImage('images/cutlery2.jpg'),
                                  productName: 'Silverware Set',
                                  location: "Yobe",
                                  price: '₦590,670,000',
                                  productDescription:
                                      "Introducing a sleek and contemporary silverware collection that enhances your table setting. Meticulously crafted from durable stainless steel, this set showcases clean lines and a minimalist aesthetic. With ergonomic handles for a comfortable grip, each piece embodies a perfect balance of form and function. Upgrade your dining ambiance with this versatile silverware set that complements any culinary occasion",
                                );
                              }));
                            },
                            image: const AssetImage('images/cutlery2.jpg'),
                            productName: 'Silverware Set',
                            location: "Yobe",
                            price: '₦590,670,000',
                          ),
                          DeclutterScrollCard(
                            image: const AssetImage('images/chandelier.jpg'),
                            productName: 'Crystal Chandelier',
                            location: 'Abuja',
                            price: '₦185,000',
                            onPressed: () {},
                          ),
                          DeclutterScrollCard(
                            image: const AssetImage('images/dinnerware.jpg'),
                            productName: 'Antique China Dinnerware',
                            location: 'Port-Hacourt',
                            price: '₦320,000',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),

                  // BarterScrollCard(
                  //   image: AssetImage('images/img1.png'),
                  //   productName: 'Mid-Century Modern Chair 2023 Model jgspjgtrjjggggggggggggggggggggghfhhrehjgjjkjjkjjj',
                  //   location: 'Lagos',
                  //   expectedExchange: 'Mac Pro Max jgspjgtrjjggggggggggggggggggggghfhhrehjgjjkjjkjjj',
                  // ),
                  // BarterScrollCard(
                  //   image: AssetImage('images/img2.png'),
                  //   productName: 'Silverware Set',
                  //   location: 'Lagos',
                  //   expectedExchange: 'iPhone 15 Max',
                  // ),
                ],
              ),
            ),

            const AdvertContent(),
            const SizedBox12(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.0),
              child: DeclutterFlashsalesCard(
                image: AssetImage('images/lens.jpg'),
                productName: "Canon Camera Lens",
                location: "Port-Hacourt",
                oldPrice: "₦185,000",
                newPrice: "₦80,000",
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 11.0,
              ),
              // padding: const EdgeInsets.only(left: 11.0, right: 11.0,), //remove the right later
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "Gift",
                      style: titleStyle,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        children: [
                          GiftScrollCard(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ProductDescriptionView(
                                  image: AssetImage('images/bikehelmet.jpg'),
                                  productName: "Bicycle helmet",
                                  location: "Ogun",
                                  productDescription:
                                      "Stay safe on your cycling adventures with this high-quality bicycle helmet. Designed for both style and protection, it features a sleek aerodynamic shape and adjustable straps for a secure fit. The impact-resistant outer shell and cushioned interior provide excellent head protection, ensuring you can pedal with confidence on roads or trails.",
                                );
                              }));
                            },
                            image: const AssetImage('images/bikehelmet.jpg'),
                            productName: "Bicycle helmet",
                            location: "Ogun",
                          ),
                          GiftScrollCard(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ProductDescriptionView(
                                  image: AssetImage('images/sunglasses.jpg'),
                                  productName: "Sunglasses",
                                  location: "Delta",
                                  productDescription:
                                      "Step into the sun with confidence wearing these timeless aviator sunglasses. Featuring a sleek metal frame and UV-protective lenses, they offer both style and practicality. The iconic teardrop shape and adjustable nose pads ensure a comfortable fit, while reducing glare and shielding your eyes from harmful rays. Whether you're strolling through the city or lounging on the beach, these sunglasses are a must-have accessory for any sunny day.",
                                );
                              }));
                            },
                            image: const AssetImage('images/sunglasses.jpg'),
                            productName: "Sunglasses",
                            location: "Delta",
                          ),
                          GiftScrollCard(
                            image: const AssetImage('images/mug.jpg'),
                            productName: "Coffee mug",
                            location: "Kwara",
                            onPressed: () {},
                          ),
                          GiftScrollCard(
                            image: const AssetImage('images/umbrella.jpg'),
                            productName: "Umbrella",
                            location: "Plateau",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),

                  // BarterScrollCard(
                  //   image: AssetImage('images/img1.png'),
                  //   productName: 'Mid-Century Modern Chair 2023 Model jgspjgtrjjggggggggggggggggggggghfhhrehjgjjkjjkjjj',
                  //   location: 'Lagos',
                  //   expectedExchange: 'Mac Pro Max jgspjgtrjjggggggggggggggggggggghfhhrehjgjjkjjkjjj',
                  // ),
                  // BarterScrollCard(
                  //   image: AssetImage('images/img2.png'),
                  //   productName: 'Silverware Set',
                  //   location: 'Lagos',
                  //   expectedExchange: 'iPhone 15 Max',
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

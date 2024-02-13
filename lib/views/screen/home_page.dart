import 'package:e_commers_exam/utils/product_utils.dart';
import 'package:flutter/material.dart';
import '../../utils/route_utils.dart';
import '../componets/product_cart.dart';
import '../componets/searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> category = [];

  @override
  void initState() {
    category = allProducts
        .map((e) => e['category'].toString().toLowerCase())
        .toSet()
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        backgroundColor: Colors.grey[200],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                MyRoutes.cartPage,
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xff9775FA),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              child: Text('User'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //searchbar
              searchbar(size: size),
              //Choose category
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Choose category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff8F959E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              category.length,
                              (index) => Container(
                                // height: 90,
                                // width: 150,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                margin: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade100,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 3,
                                      offset: Offset(3.0, 3.0),
                                      // spreadRadius: 1,
                                    ),
                                  ],
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.primaries[index % 18],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    category[index].toLowerCase().replaceFirst(
                                          category[index][0],
                                          category[index][0].toUpperCase(),
                                        ),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //New Arrival
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Arrival",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text("View all"),
                ],
              ),
              //All Products
              ...List.generate(
                allProducts.length ~/ 2,
                (index) => Row(
                  children: [
                    productCard(
                      size: size,
                      index: index * 2,
                      context: context,
                      product: {},
                    ),
                    productCard(
                      size: size,
                      index: index * 2 + 1,
                      context: context,
                      product: {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_commers_exam/views/componets/product_cart.dart';
import 'package:flutter/material.dart';
import '../../utils/product_utils.dart';

Widget categoryView({
  required Size size,
  required String category,
  required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //Title
      Text(
        category.replaceFirst(category[0], category[0].toUpperCase()),
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      //CategorySlide
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: allProducts
              .map(
                (e) => e['category'] == category
                    ? productCard(
                        context: context,
                        size: size,
                        product: e,
                        index: 0,
                      )
                    : Container(),
              )
              .toList(),
        ),
      ),
      SizedBox(
        height: size.height * 0.03,
      ),
    ],
  );
}

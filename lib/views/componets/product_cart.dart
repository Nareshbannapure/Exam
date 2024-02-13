import 'package:e_commers_exam/utils/product_utils.dart';
import 'package:flutter/material.dart';
import '../../utils/route_utils.dart';

Widget productCard({
  required Size size,
  required int index,
  required BuildContext context,
  required Map product,
}) {
  return Expanded(
    child: Container(
      height: size.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  MyRoutes.detailPage,
                );
              },
              child: Container(
                height: size.height * 18 / 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.grey.shade50,
                  image: DecorationImage(
                    image: NetworkImage(allProducts[index]['thumbnail']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                allProducts[index]['title'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\$ ${allProducts[index]['price']}/-".toString(),
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.red,
                  decorationThickness: 1.5,
                  fontSize: 18,
                  color: Colors.red.shade500,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

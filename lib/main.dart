import 'package:flutter/material.dart';
import 'package:e_commers_exam/utils/route_utils.dart';
import 'package:e_commers_exam/views/screen/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => const HomePage(),
      },
    );
  }
}

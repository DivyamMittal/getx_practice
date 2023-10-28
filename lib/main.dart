import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/Screens/SecondScreen/View/second_page.dart';
import 'package:getx_practice/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: '/',
      // unknownRoute: GetPage(name: '/notFound', page: () => UnknownPage()),
      getPages: [
        GetPage(name: '/', page: () => MyApp()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(
            name: '/secondPage',
            page: () => SecondPage(),
            transition: Transition.rightToLeftWithFade)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/main_tcpip_page.dart';
import 'package:flutter_application_1/pages/orders/orders_detail.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 72, 66, 82)),
        useMaterial3: true,
        ),
      //home: const MainFoodPage(),
      home: const PopularOrderDetail(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/popular_product_controller.dart';
import 'package:flutter_application_1/pages/home/main_tcpip_page.dart';
import 'package:flutter_application_1/pages/orders/orders_detail.dart';
import 'package:flutter_application_1/pages/orders/recommended_orders.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  // Waiting until all dependencies are loaded
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 72, 66, 82)),
        useMaterial3: true,
        ),
      //home: const MainFoodPage(),
      home: const PopularOrderDetail(),
      //home: const RecommendedOrders(),
    );
  }
}

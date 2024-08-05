import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/popular_product_controller.dart';
import 'package:flutter_application_1/controller/recommended_product_controller.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:flutter_application_1/pages/home/orders_page_body.dart';
import 'package:flutter_application_1/pages/orders/orders_detail.dart';
import 'package:flutter_application_1/pages/orders/recommended_orders.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
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
  @override
  // This widget is the root of application
  Widget build(BuildContext context) {
    // Method to load the data from server
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MainFoodPage(),
      //home: const PopularOrderDetail(),
      //home: const RecommendedOrders(),
      //initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

import 'package:flutter_application_1/pages/home/main_tcpip_page.dart';
import 'package:flutter_application_1/pages/orders/orders_detail.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial = "/";
  static const String popularFood = "/popular-food";

  // Function to pass parameters when calling pages
  static String getInitial()=>initial;
  static String getPopularFood()=>popularFood;

  static List<GetPage> routes=[
    GetPage(name: "/", page: ()=>const MainFoodPage()),
    GetPage(
      name: popularFood,
      page: (){
        return const PopularOrderDetail();
        },
      transition: Transition.fadeIn,
    ),
  ];
}
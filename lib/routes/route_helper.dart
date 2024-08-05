import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:flutter_application_1/pages/orders/orders_detail.dart';
import 'package:flutter_application_1/pages/orders/recommended_orders.dart';
import 'package:get/get.dart';

// Route helper to create routes between pages
class RouteHelper{
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended_orders";

  // Function to pass parameters when calling pages
  static String getInitial()=>initial;
  static String getPopularFood(int pageId)=>'$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId)=>'$recommendedFood?pageId=$pageId';

  static List<GetPage> routes=[
    GetPage(name: "/", page: ()=>const MainFoodPage()),
    
    GetPage(name: popularFood, page: (){
      var pageId=Get.parameters['pageId'];
      return PopularOrderDetail(pageId:int.parse(pageId!));
      },
    transition: Transition.fadeIn,
    ),
    
    GetPage(name: recommendedFood, page: (){
      var pageId=Get.parameters['pageId'];
      return RecommendedOrders(pageId:int.parse(pageId!));
        },
    transition: Transition.fadeIn,
    ),
  ];
}
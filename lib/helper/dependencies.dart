import 'package:flutter_application_1/controller/popular_product_controller.dart';
import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init()async {

  // Way to load repository into function
  
  // API client
  Get.lazyPut(()=>ApiClient(appBaseUrl: "https://mvs.bslmeiyu.com"));

  // Repository
  Get.lazyPut(()=>PopularProductRepo(apiClient:Get.find()));

  // Controllers
  Get.lazyPut(()=>PopularProductController(popularProductRepo:Get.find()));
}
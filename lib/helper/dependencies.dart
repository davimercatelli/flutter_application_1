import 'package:flutter_application_1/controller/popular_product_controller.dart';
import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init()async {

  // Way to load repository into function
  
  // API client
  //Get.lazyPut(()=>ApiClient(appBaseUrl: "https://mvs.bslmeiyu.com"));
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // Repository
  Get.lazyPut(()=>PopularProductRepo(apiClient:Get.find()));

  // Controllers
  Get.lazyPut(()=>PopularProductController(popularProductRepo:Get.find()));
}
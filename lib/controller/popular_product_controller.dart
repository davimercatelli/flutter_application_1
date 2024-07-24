import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:flutter_application_1/models/popular_products_models.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxService{
  final PopularProductRepo popularProductRepo;
  PopularProductController({
    required this.popularProductRepo
    });
  
  // _popularProductList is a private variable
  List<dynamic> _popularProductList=[];

  // Save private variable into a public variable
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      _popularProductList=[];
      _popularProductList.addAll(Products.fromJson(response.body).products);
      //update();
    }else{

    }
  }
}
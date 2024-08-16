import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:flutter_application_1/models/popular_products_models.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  int _quantity=0;
  int get quantity=>_quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Products.fromJson(response.body).products);
      _isLoaded=true;
      update();
      }else{
    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      print("increment"+_quantity.toString());
      _quantity=checkQuantity(_quantity+1);
    }else{
      _quantity=checkQuantity(_quantity-1);
    }
    update();
  }
  int checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar("Item count", "You can't reduce more!",);
      return 0;
    }else if(quantity>20){
      Get.snackbar("Item count", "You can't add more!",);
      return 20;
    }else{
      return quantity;
    }
  }
  void initProduct(){
    _quantity=0;
  }
}
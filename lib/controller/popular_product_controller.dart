import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:flutter_application_1/models/popular_products_models.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItens => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Products.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      print("Increment " + _quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print("Decrement " + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "You can't reduce more!",
      );
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Item count", "You can't add more!");
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print("Exist or not " + exist.toString());
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print("Quantity = " + _inCartItems.toString());
  }

  void addItem(
    ProductModel product,
  ) {
    //   if(_quantity>0){
    _cart.addItem(product, _quantity);

    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      print("The id is " +
          value.id.toString() +
          " and the quantity is " +
          value.quantity.toString());
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }
}

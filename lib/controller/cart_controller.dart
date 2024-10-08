import 'package:flutter_application_1/data/repository/cart_repo.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/models/popular_products_models.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  final Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  // Function to add items
  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    // Check if the items are already add to shopping cart
    // Update the map
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {

        totalQuantity = value.quantity! + quantity;
        
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      }
    );

      // If the total quantity is less than 0, remove the product from shopping cart
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }

    // If the items are added for the first time to shopping cart
    // Use putIfAbsent
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );
        }
      );

      // Not possible to add 0 items to shopping cart
      } else {
        Get.snackbar(
          "Item count",
          "You should at least add item in the cart",
        );
      }
    }
    update();
  }

  // Check if the product exist on cart
  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  // Get the total amount in the shopping cart
  getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  // List to print the items on cart page
  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();

    }
  
  int get totalAmount{
    var total=0;
    _items.forEach( ( key, value ) {
      total += value.quantity!*value.price! ;
    });
      return total;
  }


}

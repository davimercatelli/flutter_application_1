import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/controller/popular_product_controller.dart';
import 'package:flutter_application_1/controller/recommended_product_controller.dart';
import 'package:flutter_application_1/models/popular_products_models.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  ProductModel? get product => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            // Header - Back, Home Page and Shopping Cart icons
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(
                  width: Dimensions.width20 * 11,
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            )
          ),
          
          // Items on cart
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController){
                  var _cartList = cartController.getItems;
                  return ListView.builder(
                    itemCount: _cartList.length,
                    itemBuilder: ( _, index ) {
                      return SizedBox(
                        height: Dimensions.height20 * 5,
                        width: double.maxFinite,
                          child: Row(
                            children: [

                              // Product on cart images
                              GestureDetector(
                                onTap: (){
                                  // Sub index. Get the product index from cart index
                                  var popularIndex = Get.find<PopularProductController>()
                                    .popularProductList
                                    .indexOf(_cartList[index].product!);
                                  if( popularIndex >= 0 ){
                                    Get.toNamed( RouteHelper.getPopularFood( popularIndex,"cartpage" ) );
                                  } else {
                                    var recommendedIndex = Get.find<RecommendedProductController>()
                                      .recommendedProductList
                                      .indexOf( _cartList[index].product! );
                                    Get.toNamed( RouteHelper.getRecommendedFood( recommendedIndex, "cartpage" ) );
                                  }
                                },
                                child: Container(
                                width: Dimensions.height20 * 5,
                                height: Dimensions.height20 * 5,
                                margin: EdgeInsets.only( bottom: Dimensions.height10 ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URI+cartController.getItems[index].img!)
                                  ),
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  color: Colors.white,
                                ),
                              ),
                              ),
                              
                              // Space between Images and Description
                              SizedBox( width: Dimensions.width20 ),
                              
                              // Product name, description, price and quantity
                              Expanded(
                                child: SizedBox(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    // Product name and description
                                    children: [
                                      BigText(text: cartController.getItems[index].name!, color: Colors.black54),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        // Product price
                                        children: [
                                          BigText( text: "\$${cartController.getItems[index].price}", color: Colors.redAccent ),
                                          // Quatity and +/- icons
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: Dimensions.height15,
                                              bottom: Dimensions.height15,
                                              left: Dimensions.width20,
                                              right: Dimensions.width20
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                BorderRadius.circular(
                                                  Dimensions.radius20
                                                ),
                                              color: AppColors.frontContainer,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    print("REMOVE");
                                                    cartController.addItem(_cartList[index].product!, -1);
                                                  },
                                                  child: const Icon( Icons.remove, color: AppColors.iconColor0 ),
                                                ),
                                                SizedBox( width: Dimensions.width10 ),
                                                // Product quantity
                                                BigText( text: _cartList[index].quantity.toString() ),
                                                SizedBox( width: Dimensions.width10 ),
                                                GestureDetector(
                                                  onTap: () {
                                                    print("ADD");
                                                    cartController.addItem(_cartList[index].product!, 1);
                                                  },
                                                  child: const Icon( Icons.add, color: AppColors.iconColor0 )
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    );
                  }
                ),
              ),
            )
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: ( cartProduct ) {
          return Container(
            // Color and radius
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20
            ),
            decoration: BoxDecoration(
              color: AppColors.bottomCartColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular( Dimensions.radius20 * 2 ),
                topRight: Radius.circular( Dimensions.radius20 * 2 ),
              )
            ),

            // Bottom bar and total value
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Bottom bar - add icon, quantity and remove icon
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    bottom: Dimensions.height15,
                    left: Dimensions.width20,
                    right: Dimensions.width20
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular( Dimensions.radius20 ),
                    color: AppColors.frontContainer,
                  ),
                  child: Row(
                    children: [                     
                      // Total final price
                      BigText( text: "\$ ${cartProduct.totalAmount}" ),
                    ],
                  ),
                ),

                  // Price and 'Add to cart' buttom
                  GestureDetector(
                    onTap: (){
                      //popularProduct.addItem( product );
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: Dimensions.height15,
                        bottom: Dimensions.height15,
                        left: Dimensions.width20,
                        right: Dimensions.width20
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular( Dimensions.radius20 ),
                        color: AppColors.frontContainer,
                      ),
                     // child: BigText( text: "\$ ${product.price!} | Checkout", color: AppColors.mainBlackColor ),
                       child: BigText( text: "Checkout", color: AppColors.mainBlackColor ),
                    ),
                  )
                ],
              ),
            );
          },
        )
    
    );
  }
}

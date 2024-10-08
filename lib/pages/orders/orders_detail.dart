
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/controller/popular_product_controller.dart';
import 'package:flutter_application_1/pages/cart/cart_page.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:flutter_application_1/pages/home/orders_page_body.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_column.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/expandable_text.dart';
import 'package:get/get.dart';

class PopularOrderDetail extends StatelessWidget {
  final int pageId;
  final String page;
  PopularOrderDetail({
    super.key, 
    required this.pageId, 
    required this.page
  });

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: AppColors.frontContainer,
      // Background image, header and detail text
      body: Stack(
        children: [
          // Background detail image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularOrders,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage( AppConstants.BASE_URL + AppConstants.UPLOAD_URI + product.img! )
                )
              ),
            ),
          ),

          // Order details header - back icon and shopping icon
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width45,
            right: Dimensions.width45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back icon
                GestureDetector(
                  onTap: () {
                    if( page=="cartpage" ){
                      Get.toNamed( RouteHelper.getCartPage() );
                    } else {
                      Get.toNamed( RouteHelper.getInitial() );
                    }
                  },
                  child: const AppIcon(icon: Icons.arrow_back_ios)
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: (){
                      if(controller.totalItems >= 1){
                        Get.toNamed(RouteHelper.getCartPage());
                      }
                    },
                    child: Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined, size: Dimensions.height40,),
                        controller.totalItems >= 1 
                        ? Positioned(
                          right: 0,
                          top: 0,
                          child: AppIcon(
                            icon: Icons.circle,
                            size: Dimensions.height20,
                            iconColor: AppColors.mainColor,
                            backgroundColor: AppColors.mainColor,
                            ),
                          )
                          : Container(),
                          controller.totalItems >= 1
                          ? Positioned(
                                
                                right: 8,
                                top: 2,
                                  child: BigText(
                                    text: Get.find<PopularProductController>().totalItems.toString(),
                                    size: Dimensions.font15,
                                    color: AppColors.mainKnappColor,
                                  ),
                              )
                              : Container(),
                            
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),

          // Order details text
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularOrders - Dimensions.height20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular( Dimensions.radius20 ),
                  topLeft: Radius.circular( Dimensions.radius20 ),
                ),
                color: AppColors.frontContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: product.name!,
                  ),

                  // Empty vertical space
                  SizedBox( height: Dimensions.height30 ),

                  // Introduce text
                  BigText(text: "Description", size: Dimensions.font20),

                  // Empty vertical space
                  SizedBox( height: Dimensions.height20 ),

                  // Description text
                  // NOTE: SingleChildScrollView is used to enable scroll view and need to be inside of Expanded!!!
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: product.description!
                      )
                    ),
                  )
                ],
              )
            ),
          ),
        ],
      ),

      // Bottom bar
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: ( popularProduct ) {
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
                      // Remove icon buttom
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity( false );
                        },
                        child: const Icon( Icons.remove, color: AppColors.iconColor0 ),
                      ),
                      
                      // Space between remove icon and quantity
                      SizedBox( width: Dimensions.width10 ),
                      
                      // Total quantity picked or already in shopping cart
                      BigText( text: popularProduct.inCartItens.toString() ),
                      
                      // Space between quantity and add icon 
                      SizedBox(width: Dimensions.width10),

                      
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: const Icon( Icons.add, color: AppColors.iconColor0 ) 
                      )
                    ],
                  ),
                ),

                  // Price and 'Add to cart' buttom
                  GestureDetector(
                    onTap: (){
                      popularProduct.addItem( product );
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
                      child: BigText( text: "\$ ${product.price!} | Add to cart", color: AppColors.mainBlackColor ),
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

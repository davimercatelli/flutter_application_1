import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
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
                      Get.to(()=>const MainFoodPage());
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
              )),
          Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                //color: Colors.yellow,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController){
                    return ListView.builder(
                      itemCount: cartController.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
                          height: Dimensions.height20 * 5,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              Container(
                                width: Dimensions.height20 * 5,
                                height: Dimensions.height20 * 5,
                                margin: EdgeInsets.only(bottom: Dimensions.height10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URI+cartController.getItems[index].img!)),
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width20,
                              ),
                              Expanded(
                                child: Container(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text: cartController.getItems[index].name!, color: Colors.black54),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText( text: cartController.getItems[index].price.toString(), color: Colors.redAccent,),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: Dimensions.height15,
                                                bottom: Dimensions.height15,
                                                left: Dimensions.width20,
                                                right: Dimensions.width20),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: AppColors.frontContainer,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    //popularProduct.setQuantity(false);
                                                  },
                                                  child: const Icon(Icons.remove,
                                                      color:
                                                          AppColors.iconColor0),
                                                ),
                                                SizedBox(
                                                    width: Dimensions.width10),
                                                BigText(text: "0"),
                                                SizedBox(
                                                    width: Dimensions.width10),
                                                GestureDetector(
                                                    onTap: () {
                                                      // popularProduct.setQuantity(true);
                                                    },
                                                    child: const Icon(
                                                      Icons.add,
                                                      color:
                                                          AppColors.iconColor0,
                                                    )
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
                    });
                      }),
                ),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_column.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';

class PopularOrderDetail extends StatelessWidget {
  const PopularOrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.frontContainer,
      body: Stack(
        children: [
          // Order details image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularOrders,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/maxresdefault.jpg")
                )
              ),
            ),
          ),
          
          // Order details header icons
          Positioned(
            top: Dimensions.height20,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart),
              ],
            ),
          ),

          // Order details text
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularOrders-Dimensions.height20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight:  Radius.circular(Dimensions.radius20),
                  topLeft:  Radius.circular(Dimensions.radius20),
                  ),
                color: AppColors.frontContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(text: "Order Types",),
                  
                  // Empty vertical space
                  SizedBox(height: Dimensions.height20,),
                  
                  // Introduce text
                  BigText(text: "Introduce", size: Dimensions.font20),
                  
                  // Empty vertical space
                  SizedBox(height: Dimensions.height20,),
                  ],
                )
              ),
            ),
          ],
        ),
      
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.bottomCartColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
            )
          ),
        child: Row(
          children: [
            Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.frontContainer,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.iconColor0)
                ],
              ),
            )
          ],
        ),
        ),
      );
    }
  }
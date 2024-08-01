import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/home/main_tcpip_page.dart';
import 'package:flutter_application_1/pages/home/orders_page_body.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_column.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/expandable_text.dart';
import 'package:get/get.dart';

class PopularOrderDetail extends StatelessWidget {
  const PopularOrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.frontContainer,
      body: Stack(
        children: [
          // Background image
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(()=>MainFoodPage());
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios)
                  ),
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
                  SizedBox(height: Dimensions.height30,),
                  
                  // Introduce text
                  BigText(text: "Introduce", size: Dimensions.font20),
                  
                  // Empty vertical space
                  SizedBox(height: Dimensions.height20,),
                  
                  // Description text
                  // NOTE: SingleChildScrollView is used to enable scroll view and need to be inside of Expanded!!!
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mattis eget augue ut semper. Praesent eu felis congue est vestibulum tincidunt eget nec magna. Proin gravida nisi quis luctus euismod. Mauris commodo molestie ligula, ac maximus urna ornare id. Donec consectetur nibh nibh, viverra pellentesque metus fringilla sed. Vestibulum ac neque vel tellus porttitor semper vitae quis lectus. Etiam pulvinar lorem vitae tellus luctus consectetur.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mattis eget augue ut semper. Praesent eu felis congue est vestibulum tincidunt eget nec magna. Proin gravida nisi quis luctus euismod. Mauris commodo molestie ligula, ac maximus urna ornare id. Donec consectetur nibh nibh, viverra pellentesque metus fringilla sed. Vestibulum ac neque vel tellus porttitor semper vitae quis lectus. Etiam pulvinar lorem vitae tellus luctus consectetur.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mattis eget augue ut semper. Praesent eu felis congue est vestibulum tincidunt eget nec magna. Proin gravida nisi quis luctus euismod. Mauris commodo molestie ligula, ac maximus urna ornare id. Donec consectetur nibh nibh, viverra pellentesque metus fringilla sed. Vestibulum ac neque vel tellus porttitor semper vitae quis lectus. Etiam pulvinar lorem vitae tellus luctus consectetur.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mattis eget augue ut semper. Praesent eu felis congue est vestibulum tincidunt eget nec magna. Proin gravida nisi quis luctus euismod. Mauris commodo molestie ligula, ac maximus urna ornare id. Donec consectetur nibh nibh, viverra pellentesque metus fringilla sed. Vestibulum ac neque vel tellus porttitor semper vitae quis lectus. Etiam pulvinar lorem vitae tellus luctus consectetur.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mattis eget augue ut semper. Praesent eu felis congue est vestibulum tincidunt eget nec magna. Proin gravida nisi quis luctus euismod. Mauris commodo molestie ligula, ac maximus urna ornare id. Donec consectetur nibh nibh, viverra pellentesque metus fringilla sed. Vestibulum ac neque vel tellus porttitor semper vitae quis lectus. Etiam pulvinar lorem vitae tellus luctus consectetur.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mattis eget augue ut semper. Praesent eu felis congue est vestibulum tincidunt eget nec magna. Proin gravida nisi quis luctus euismod. Mauris commodo molestie ligula, ac maximus urna ornare id. Donec consectetur nibh nibh, viverra pellentesque metus fringilla sed. Vestibulum ac neque vel tellus porttitor semper vitae quis lectus. Etiam pulvinar lorem vitae tellus luctus consectetur.")
                      )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      
      // Bottom bar
      bottomNavigationBar: Container(
        // Color and radius
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.bottomCartColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
            )
          ),
        
        // Bottom bar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           // Bottom bar - add or remove items
           Container(
              padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.frontContainer,
              ),
              child: Row(
                children: [
                  const Icon(Icons.remove, color: AppColors.iconColor0),
                  SizedBox(width: Dimensions.width10),
                  BigText(text: "1"),
                  SizedBox(width: Dimensions.width10),
                  const Icon(Icons.add, color: AppColors.iconColor0,)
                ],
              ),
            ),
            
            // Total value buttom
            Container(
              padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15, left: Dimensions.width20, right: Dimensions.width20),
              child: BigText(text: "US10 | Add to cart", color: AppColors.mainBlackColor,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.frontContainer,
              ),
            )
          ],
        ),
      ),
    );
  }
}
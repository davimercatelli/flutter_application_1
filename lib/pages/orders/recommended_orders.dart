import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/controller/recommended_product_controller.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/expandable_text.dart';
import 'package:get/get.dart';

class RecommendedOrders extends StatelessWidget {
  int pageId;
  RecommendedOrders({
    super.key,
    required this.pageId
  });

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: AppColors.frontContainer,
      body: CustomScrollView(
        slivers: [
          // Header - Clear and shopping Icons
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            // Clear and shopping Icons
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Clear icon
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                // Shopping icon
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),

            // Top fixed title
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: Dimensions.radius15, bottom: Dimensions.radius15),
                decoration: BoxDecoration(
                  color: AppColors.frontContainer,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  )
                ),
                child: Center(
                  child: BigText(size: Dimensions.font20, text: product.name!),
                ),
              )
            ),

            // Background image
            pinned: true,
            backgroundColor: AppColors.mainKnappColor,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URI+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              )
            ),
          ),

          // Height adaptable size text box
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(
                    text: product.description!
                    ),
                )
              ],
            )
          ),
        ],
      ),

      // Bottom bar with add and remove
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 6.5,
                right: Dimensions.width20 * 6.5,
                top: Dimensions.height20,
                bottom: Dimensions.height20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 // Add icon
                AppIcon(iconSize: Dimensions.iconSize24, icon: Icons.remove),

                // Amount of itens
                BigText(
                  text: "\$ ${product.price!} X 0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),

                // Remove icon
                AppIcon(iconSize: Dimensions.iconSize24, icon: Icons.add),
              ],
            ),
          ),

          // Bottom Navigation bar
          Container(
            // Color and radius
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.bottomCartColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                    size: Dimensions.iconSize24)
                ),

                // Total value buttom
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15, left: Dimensions.width20, right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.frontContainer,
                  ),
                  child: BigText(
                    text: "US10 | Add to cart",
                    color: AppColors.mainBlackColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

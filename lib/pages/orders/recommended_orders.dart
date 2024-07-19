import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/expandable_text.dart';

class RecommendedOrders extends StatelessWidget {
  const RecommendedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.frontContainer,
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            toolbarHeight: 80,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Clear icon
                AppIcon(icon: Icons.clear),

                // Shopping icon
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),

            bottom: PreferredSize(
                // Top and fixed text
                preferredSize: Size.fromHeight(30),
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
                    child: BigText(size: Dimensions.font20, text: "My fck scrollable container"),
                  ),
                )
              ),

            // Backgroun image
            pinned: true,
            backgroundColor: AppColors.mainKnappColor,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/Banner.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Height adaptable size text box
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                child: const ExpandableTextWidget(
                  text:
                      "Phasellus sit amet cursus leo. Nullam lacus quam, vehicula vel ligula eget, maximus posuere lectus. Etiam interdum congue massa nec hendrerit. Praesent vitae lobortis sem, quis aliquam elit. Proin lorem magna, porttitor et ornare nec, cursus ut nunc. Vivamus tempus suscipit nisi, quis pulvinar eros ultrices nec. Phasellus diam ex, vehicula ut pulvinar at, imperdiet nec eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ornare, ex vitae dapibus luctus, dolor nunc pellentesque tortor, et sollicitudin erat velit sit amet sapien. Cras vel justo risus. Ut at nibh non erat ullamcorper pellentesque vitae in lorem. Aenean tempus velit lacus, et ultrices mauris egestas eget. Phasellus ornare tortor volutpat est viverra, sed facilisis mauris posuere. Phasellus non justo laoreet dui finibus efficitur. Donec eget venenatis turpis, vel vehicula libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Phasellus sit amet cursus leo. Nullam lacus quam, vehicula vel ligula eget, maximus posuere lectus. Etiam interdum congue massa nec hendrerit. Praesent vitae lobortis sem, quis aliquam elit. Proin lorem magna, porttitor et ornare nec, cursus ut nunc. Vivamus tempus suscipit nisi, quis pulvinar eros ultrices nec. Phasellus diam ex, vehicula ut pulvinar at, imperdiet nec eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ornare, ex vitae dapibus luctus, dolor nunc pellentesque tortor, et sollicitudin erat velit sit amet sapien. Cras vel justo risus. Ut at nibh non erat ullamcorper pellentesque vitae in lorem. Aenean tempus velit lacus, et ultrices mauris egestas eget. Phasellus ornare tortor volutpat est viverra, sed facilisis mauris posuere. Phasellus non justo laoreet dui finibus efficitur. Donec eget venenatis turpis, vel vehicula libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Phasellus sit amet cursus leo. Nullam lacus quam, vehicula vel ligula eget, maximus posuere lectus. Etiam interdum congue massa nec hendrerit. Praesent vitae lobortis sem, quis aliquam elit. Proin lorem magna, porttitor et ornare nec, cursus ut nunc. Vivamus tempus suscipit nisi, quis pulvinar eros ultrices nec. Phasellus diam ex, vehicula ut pulvinar at, imperdiet nec eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ornare, ex vitae dapibus luctus, dolor nunc pellentesque tortor, et sollicitudin erat velit sit amet sapien. Cras vel justo risus. Ut at nibh non erat ullamcorper pellentesque vitae in lorem. Aenean tempus velit lacus, et ultrices mauris egestas eget. Phasellus ornare tortor volutpat est viverra, sed facilisis mauris posuere. Phasellus non justo laoreet dui finibus efficitur. Donec eget venenatis turpis, vel vehicula libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Phasellus sit amet cursus leo. Nullam lacus quam, vehicula vel ligula eget, maximus posuere lectus. Etiam interdum congue massa nec hendrerit. Praesent vitae lobortis sem, quis aliquam elit. Proin lorem magna, porttitor et ornare nec, cursus ut nunc. Vivamus tempus suscipit nisi, quis pulvinar eros ultrices nec. Phasellus diam ex, vehicula ut pulvinar at, imperdiet nec eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ornare, ex vitae dapibus luctus, dolor nunc pellentesque tortor, et sollicitudin erat velit sit amet sapien. Cras vel justo risus. Ut at nibh non erat ullamcorper pellentesque vitae in lorem. Aenean tempus velit lacus, et ultrices mauris egestas eget. Phasellus ornare tortor volutpat est viverra, sed facilisis mauris posuere. Phasellus non justo laoreet dui finibus efficitur. Donec eget venenatis turpis, vel vehicula libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Phasellus sit amet cursus leo. Nullam lacus quam, vehicula vel ligula eget, maximus posuere lectus. Etiam interdum congue massa nec hendrerit. Praesent vitae lobortis sem, quis aliquam elit. Proin lorem magna, porttitor et ornare nec, cursus ut nunc. Vivamus tempus suscipit nisi, quis pulvinar eros ultrices nec. Phasellus diam ex, vehicula ut pulvinar at, imperdiet nec eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ornare, ex vitae dapibus luctus, dolor nunc pellentesque tortor, et sollicitudin erat velit sit amet sapien. Cras vel justo risus. Ut at nibh non erat ullamcorper pellentesque vitae in lorem. Aenean tempus velit lacus, et ultrices mauris egestas eget. Phasellus ornare tortor volutpat est viverra, sed facilisis mauris posuere. Phasellus non justo laoreet dui finibus efficitur. Donec eget venenatis turpis, vel vehicula libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
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
                  text: "\$12.88 " + " X " + " 0",
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
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.bottomCartColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                )),

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
                  padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      bottom: Dimensions.height15,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  child: BigText(
                    text: "US10 | Add to cart",
                    color: AppColors.mainBlackColor,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.frontContainer,
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

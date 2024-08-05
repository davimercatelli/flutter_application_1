import 'dart:ui';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/popular_product_controller.dart';
import 'package:flutter_application_1/controller/recommended_product_controller.dart';
import 'package:flutter_application_1/models/popular_products_models.dart';
import 'package:flutter_application_1/pages/orders/orders_detail.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_column.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/icon_text_widget.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:get/get.dart';

class OrdersPageBody extends StatefulWidget {
  const OrdersPageBody({super.key});
  @override
  State<OrdersPageBody> createState() => _OrdersPageBodyState();
}

// To control horizontal slide panel on windows/desktop debug mode
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class _OrdersPageBodyState extends State<OrdersPageBody> {
  
  // pageController to merge the pictures on scrollbar
  PageController pageController = PageController(viewportFraction: 0.85);

  // Current Page
  var _currPageValue = 0.0;

  // Scale factor to zoom in
  final double _scaleFactor = 0.8;

  // Height top container
  final double _height = Dimensions.pageViewContainer;

  // Get page index for the Popular slider panel
  @override
  void initState() {
    super.initState();
    pageController.addListener( () {
      setState((){
        _currPageValue = pageController.page!;
        });
      }
    );
  }

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  @override
  // Widget to build Popular Food panel and Recommended Foods
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Popular foods slider upper panel
        GetBuilder<PopularProductController>(builder:(popularProducts){
          return popularProducts.isLoaded?SizedBox(
            height: Dimensions.pageViewFront,
            //child: GestureDetector(
            //  onTap: (){
            //    Get.toNamed(RouteHelper.getPopularFood());
            //  },
              child: PageView.builder(
                controller: pageController,
                scrollBehavior: AppScrollBehavior(),
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, popularProducts.popularProductList[position]);
                }
              ),
            ):const CircularProgressIndicator(
        //  ):const CircularProgressIndicator(
            color: AppColors.mainColor,
            );
          }
        ),
        
        // Dots indicator
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
            position: _currPageValue.floor(),
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
                ),
              ),
            );
          }
        ),
        
        // Vertical height between dots indicator and 'Recommended Text'
        SizedBox(height: Dimensions.height20),
        
        // Recommended text
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              
              // Horizontal space
              SizedBox(width: Dimensions.width20,),
              
              // Dot space
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: AppColors.mainSubtitleColor),
                ),
              
              // Horizontal space
              SizedBox(width: Dimensions.width20,),
              
              // Order paring
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: SmallText(text: "Order paring", color: AppColors.mainSubtitleColor),
              ),
            ],
          ),
        ),
        
        // Vertical height between 'Recommended Text' and recommended list
        SizedBox(height: Dimensions.height10,),

        // Recommended list
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?ListView.builder(
            physics: const NeverScrollableScrollPhysics(),            
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: recommendedProduct.recommendedProductList.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getRecommendedFood(index));
                },
                child: Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      // Bottom image section
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.frontContainer,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              AppConstants.BASE_URL+AppConstants.UPLOAD_URI+recommendedProduct.recommendedProductList[index].img!
                            ),
                          ),
                        ),
                      ),
                      
                      // Bottom text container
                      Expanded(
                        child: Container(
                          width: Dimensions.listViewTextSize,
                          height: Dimensions.listViewTextSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                              ),
                            color: AppColors.frontContainer,
                          ),
                          
                          // Text recommended
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                //SmallText(text: recommendedProduct.recommendedProductList[index].description!),
                                SmallText(text: 'Piu-piu'),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconTextWidget(icon: Icons.circle_notifications, text: "Normal", color: AppColors.mainSubtitleColor, iconColor: AppColors.iconColor0),
                                    IconTextWidget(icon: Icons.location_on, text: "1.7 km", color: AppColors.mainSubtitleColor, iconColor: AppColors.iconColor1),
                                    IconTextWidget(icon: Icons.timer, text: "12 min", color: AppColors.mainSubtitleColor, iconColor: AppColors.iconColor2),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            ):const CircularProgressIndicator(
              color: AppColors.mainColor,
            );
          }
        )
      ],
    );
  }
    
  // Widget to build Popular Food panel
  Widget _buildPageItem(int index, ProductModel popularProduct){
    // Zoom in - Front container
    Matrix4 matrix = Matrix4.identity();
    if( index == _currPageValue.floor() ){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2; 
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    // Zoom in - Next page 
    } else if( index == _currPageValue.floor() + 1 ){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    // Zoom in - Previous page
    } else if( index == _currPageValue.floor() - 1 ){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    // Zoom in - Intermediaries pages
    }else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
    }
    
    // Popular Food panel - Matrix to re-size the images on panel
    return Transform(
      transform: matrix,
      child: Stack(
        children: [    
          // Popular Food panel - Images are loaded here
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: Dimensions.width5, right: Dimensions.width5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL+AppConstants.UPLOAD_URI+popularProduct.img!
                  ),
                )
              ),
            ),
          ),
            
          // Text panel container
          Align(
            alignment: Alignment.bottomCenter,
            // Text panel - Shadows and radius
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.height30, right: Dimensions.height30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.frontContainer,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.mainColor,
                    blurRadius:  5.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                    color: AppColors.frontContainerLateralShadow,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: AppColors.frontContainerLateralShadow,
                    offset: Offset(5, 0),
                  ),
                ]
              ),
              // Text panel - Texts
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.height15, right: Dimensions.height15),
                child: AppColumn(text: popularProduct.name!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
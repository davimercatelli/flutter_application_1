import 'dart:ui';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/icon_text_widget.dart';
import 'package:flutter_application_1/widgets/small_text.dart';

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

  // Get page index for the horizontal top panel
  @override
  void initState() {
    super.initState();
    pageController.addListener( () {
      setState(() {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Horizontal panel
        SizedBox(
          height: Dimensions.pageViewFront,
          child: PageView.builder(
            controller: pageController,
            scrollBehavior: AppScrollBehavior(),
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
              }
            ),
          ),
        
        // Dots indicator for horizontal panel 
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.floor(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
              ),
            ),
          ),
        
        // Vertical height between dots indicator and 'Popular Text'
        SizedBox(height: Dimensions.height20),
        
        // Popular text
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              
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
        
        SizedBox(height: Dimensions.height30,),

        // Bottom images section
       ListView.builder(
            physics: const NeverScrollableScrollPhysics(),            
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                child: Row(
                  children: [
                    
                    // Bottom list images
                    Container(
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.frontContainer,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/image/maxresdefault.jpg"))                            
                        ),
                      ),
                    
                    // Bottom text container
                    // Expanded use all available horizontal space
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
                        child: Padding(
                          
                          padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: 'Order types to create HOST_IN messages'),
                              SmallText(text: 'Lorem ipsum dolor sit amet'),
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
                );
              }
            ),
        ],
      );
    }
    
    Widget _buildPageItem(int index){
      
      // Zoom in - Front container
      Matrix4 matrix = Matrix4.identity();
      if( index == _currPageValue.floor() ) {
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
    
      return Transform(
        transform: matrix,
        child: Stack(
          children: [
            
            // Horizontal panel images
            Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width5, right: Dimensions.width5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/image/maxresdefault.jpg"))
              ),
            ),
            
            // Text panel container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.height30, right: Dimensions.height30, bottom: Dimensions.height30),
              
              // Text panel - Shadows and radius
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Order Types"),
                    
                    // Vertical space
                    SizedBox(height: Dimensions.height5),
                    
                    // Ranking and types
                    Row(
                      children: [
                        // 5 start icons
                        Wrap(
                          children: List.generate(5, (index) => const Icon(Icons.star, color: AppColors.mainKnappColor, size: 15))
                        ),
                        
                        // Space
                        SizedBox(width: Dimensions.height20),
                        
                        // Ranking
                        SmallText(text: "4.5"),
                        
                        // Space
                        SizedBox(width: Dimensions.height20),
        
                        // Specification
                        SmallText(text: "Order types"),
        
                        // Space
                        SizedBox(width: Dimensions.height20),
        
                        // Specification
                        SmallText(text: "12N"),
                      ],
                    ),
                    
                    // Vertical space
                    SizedBox(height: Dimensions.height15),
                    
                    // Type, Location and time
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
          ),
        ],
      ),
    );
  }
}
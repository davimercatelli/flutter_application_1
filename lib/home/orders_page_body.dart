import 'dart:ui';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/icon_text_widget.dart';
import 'package:flutter_application_1/widgets/small_text.dart';

class OrdersPageBody extends StatefulWidget {
  const OrdersPageBody({super.key});

  @override
  State<OrdersPageBody> createState() => _OrdersPageBodyState();
}

// To control slide panel on windows/desktop debug mode
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
  double _scaleFactor = 0.8;

  // Heigh factor to bellow panel
  double _height = 220;

  // Get page index for the top panel
  @override
  void initState() {
    super.initState();
    pageController.addListener( () {
      setState(() {
        _currPageValue = pageController.page!;
        //print("Current value = " + _currPageValue.toString());
        });
      }
    );
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        
        // Main front panel
          height: 320,
          child: PageView.builder(
            controller: pageController,
            //scrollDirection: Axis.vertical,
            scrollBehavior: AppScrollBehavior(),
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
              }
            ),
          ),
        

        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.floor(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            ),
          ),
        ),
      ]
    );
    }
    
    Widget _buildPageItem(int index){
      
      // Create zoom in in bellow panel
      Matrix4 matrix = new Matrix4.identity();
      if( index == _currPageValue.floor() ) {
        var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2; 
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
        
      } else if( index == _currPageValue.floor() + 1 ){
        var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

      } else if( index == _currPageValue.floor() - 1 ){
        var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

      }else{
        var currScale = 0.8;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
      }

      
      return Transform(
        transform: matrix,
        child: Stack(
          children: [
            
            // Images containers on scrollbar
            Container(
            height: 220,
            margin: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
             // color: index.isEven?Colors.grey : Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/image/maxresdefault.jpg"))
              ),
            ),
            
            // Front container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color: AppColors.frontContainer,
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    //color: AppColors.frontShadowContainer,
                    color: Color.fromARGB(255, 200, 200, 200),
                    blurRadius:  5.0,
                    offset: Offset(0, 5)
                  ),
                   BoxShadow(
                    //color: AppColors.frontShadowContainer,
                    color: Colors.white,
                    offset: Offset(-5, 0),
                   ),
                    BoxShadow(
                    //color: AppColors.frontShadowContainer,
                    color: Colors.white,
                    offset: Offset(5, 0),
                   ),
                ]
              ),
              
              // Text of front container
              child: Container(
                //color: Colors.black,
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Order Types"),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        
                        // 5 start icons
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star, color: Colors.yellow, size: 15))
                        ),
                        
                        // Space
                        SizedBox(width: 10,),
                        
                        // Ranking
                        SmallText(text: "4.5"),
                        
                        // Space
                        SizedBox(width: 10,),
        
                        // Specification
                        SmallText(text: "Order types"),
        
                        // Space
                        SizedBox(width: 10,),
        
                        // Specification
                        SmallText(text: "12N"),
        
                      ],
                    ),
                    SizedBox(height: 10,),
                    
                    // Type, Location and time
                    Row(
                      children: [
                      
                        IconTextWidget(icon: Icons.circle_notifications, text: "Normal", color: AppColors.mainBlackColor, iconColor: AppColors.mainKnappColor),
                        IconTextWidget(icon: Icons.location_on, text: "1.7 km", color: AppColors.mainBlackColor, iconColor: AppColors.iconColor1),
                        IconTextWidget(icon: Icons.timer, text: "12 min", color: AppColors.mainBlackColor, iconColor: AppColors.iconColor2),
                        
                    ],)
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
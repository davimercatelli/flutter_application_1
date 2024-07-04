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

class _OrdersPageBodyState extends State<OrdersPageBody> {
  
  // pageController is the resposible to merge the pictures on scrollbar
  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Slide pages
      color: Colors.red,
      height: 320,
      child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        }),
      );
    }
    
    Widget _buildPageItem(int index){
      return Stack(
        children: [
          
          // Images containers on scrollbar
          Container(
          height: 220,
          margin: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven?Colors.grey : Colors.red,
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
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
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
                  Row(
                    children: [
                      IconTextWidget(icon: Icons.circle_notifications, text: "Normal", color: AppColors.mainBlackColor, iconColor: AppColors.mainKnappColor,)
                  ],)
                ],
              ),
            ),
            ),
          ),
        ],
      );
    }
}
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/orders_page_body.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
   
    // Print to debug screen sizes
    //print("Current height is: "+MediaQuery.of(context).size.height.toString());
    //print("Current widht is: "+MediaQuery.of(context).size.width.toString());
    
    return Scaffold(
      body: Column(
        children: [
          // Headrer - Location
          Container(
            margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(left: Dimensions.width45, right: Dimensions.width45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "São Paulo", color: AppColors.mainBlackColor),
                    Row(
                      children: [
                        SmallText(text: "Sorocaba"),
                        Icon(Icons.arrow_drop_down_rounded)
                    ],
                  ),
                ],
              ),
              
              // Header - search icon
              Center(
                child: Container(
                  width: Dimensions.height45,
                  height: Dimensions.height45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.mainColor,
                    ),
                  child: Icon(Icons.search, color: AppColors.mainKnappColor, size: Dimensions.iconSize24),
                ),
              )
            ],
          ),
        ),
          
          // Body panel
          // Expanded is a widget to allow scroll page
          Expanded(
            child: SingleChildScrollView(
              child: OrdersPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
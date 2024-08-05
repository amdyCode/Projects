import 'package:flutter/material.dart';
import 'package:food_delivery/page/food/popular_food_detail.dart';
import 'package:food_delivery/page/food/recommended_food_detail.dart';
import 'package:food_delivery/page/home/main_food_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const RecommendedFoodDetail()
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meal_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const CategoriesScreen(),
      routes: {
        "/": (context) => const CategoriesScreen(),
        "/category-meal": (context) => const CategoryMealScreen()
      },
    );
  }
}

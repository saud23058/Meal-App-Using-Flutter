import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = mealsData;
  List<Meal> favoriteMeals = [];

  void setFilter(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = mealsData.where((meal) {
        if (filters['gluten'] ?? false) {
          return false;
        }
        if (filters['lactose'] ?? false) {
          return false;
        }
        if (filters['vegan'] ?? false) {
          return false;
        }
        if (filters['vegetarian'] ?? false) {
          return false;
        }
        return true; // Return true for meals that pass all filters
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.remove(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(mealsData.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(
              favoriteMeal: favoriteMeals,
            ),
        '/category-meal': (context) => CategoryMealScreen(
              available: availableMeals,
            ),
        '/meal-details': (context) => MealDetails(toggleFavorite,isMealFavorite),
        '/filters-screen': (context) => FiltersScreen(
              saveFilter: setFilter,
              currentFilters: filters,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const CategoriesScreen());
      },
    );
  }
}

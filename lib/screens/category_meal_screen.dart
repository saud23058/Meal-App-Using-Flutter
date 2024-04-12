import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final argu = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = argu['categoryTitle'];
    final id = argu['id'];
    final categoryMeal = mealsData.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: categoryMeal[index].title,
            imageUrl: categoryMeal[index].imageUrl,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}

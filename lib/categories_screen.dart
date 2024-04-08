import 'package:flutter/material.dart';
import 'package:meal_app/category_item.dart';
import 'package:meal_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DeliMeal"),),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DummyData.map(
          (catData) => CategoryItem(title: catData.title, color: catData.color),
        ).toList(),
            ),
      ),
    );
  }
}

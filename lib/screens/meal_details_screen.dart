import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetails extends StatelessWidget {
  final Function toggleFavorite;
  final Function Favorite;

  const MealDetails(this.toggleFavorite,this.Favorite);


  @override
  Widget build(BuildContext context) {
    Widget buildSectionTitle(BuildContext context, String text) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    Widget buildContainer(BuildContext context, Widget child) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey),
        height: 200,
        width: 300,
        child: child,
      );
    }

    final mealId = ModalRoute.of(context)?.settings.arguments;
    final selectedMeal = mealsData.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, "Ingredients"),
              buildContainer(
                context,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: selectedMeal.ingredients.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(selectedMeal.ingredients[index]),
                          ),
                        );
                      }),
                ),
              ),
              buildSectionTitle(context, "steps"),
              buildContainer(
                  context,
                  ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Text(index.toString()),
                      ),
                      title: Card(
                        color: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(selectedMeal.steps[index]),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>toggleFavorite(mealId),
        child:  Icon(Favorite(mealId) ? Icons.star:Icons.star_border),
      ),
    );
  }
}

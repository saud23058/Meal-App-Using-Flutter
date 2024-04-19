import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';
import 'package:meal_app/widgets/main_drawar.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  const TabsScreen({super.key, required this.favoriteMeal});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   late List<Map<String, Object>> pages;

  int selectedPageIndex = 0;

  @override
  void initState() {
   pages=[
    {
      "page": const CategoriesScreen(),
      "title": "Categories"
    },
    {
      "page":FavouriteScreen(widget.favoriteMeal),
      "title": "Favorite items"
    },
  ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]["title"] as String),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(unselectedItemColor: Colors.grey, selectedItemColor: Colors.purple, currentIndex: selectedPageIndex, type: BottomNavigationBarType.shifting, backgroundColor: Colors.amber[400], onTap: _selectPage, items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.category_rounded),
          label: "Categories",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: "Favourite",
        ),
      ]),
    );
  }
}

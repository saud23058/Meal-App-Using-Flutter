import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
final List<Map<String,Object>>pages=[
  {"page":const CategoriesScreen(), "title" :"Categories"},
  {"page":const FavouriteScreen(), "title" :"Favorite items"},
];


int selectedPageIndex = 0;

  void _selectPage(int index){
     setState(() {
       selectedPageIndex=index;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(pages[selectedPageIndex]["title"]as String),
      ),
      body: pages[selectedPageIndex]["page"]as Widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.purple,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.amber[400],
        onTap:_selectPage ,
        items: const [
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

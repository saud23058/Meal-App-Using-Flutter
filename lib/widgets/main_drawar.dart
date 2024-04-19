import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, VoidCallback handler) {
      return ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: handler,
      );
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   handler();
    }

    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          color: Colors.pink[200],
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(20),
          child: const Text(
            "Cooking up",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile("Meal", Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed("/");
        }),
        buildListTile("Filters", Icons.settings, () {
          Navigator.of(context).pushReplacementNamed("/filters-screen");
        }),
      ]),
    );
  }
}

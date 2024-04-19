import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawar.dart';

class FiltersScreen extends StatefulWidget {
  final Function(Map<String, bool> filterData) saveFilter;
  final Map<String, bool> currentFilters;
  const FiltersScreen({Key? key, required this.saveFilter, required this.currentFilters}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  void initState() {
    glutenFree = widget.currentFilters['gluten'] ?? false;
    vegetarian = widget.currentFilters['vegetarian'] ?? false;
    vegan = widget.currentFilters['vegan'] ?? false;
    lactoseFree = widget.currentFilters['lactoseFree'] ?? false;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': glutenFree,
                'vegetarian': vegetarian,
                'vegan': vegan,
                'lactose': lactoseFree,
              };
              widget.saveFilter(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Adjust your meal selection",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "Gluten-free",
                  "Only include gluten-free meals",
                  glutenFree,
                  (newValue) => setState(() => glutenFree = newValue),
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  "Only include vegetarian meals",
                  vegetarian,
                  (newValue) => setState(() => vegetarian = newValue),
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Only include vegan meals",
                  vegan,
                  (newValue) => setState(() => vegan = newValue),
                ),
                _buildSwitchListTile(
                  "Lactose-free",
                  "Only include lactose-free meals",
                  lactoseFree,
                  (newValue) => setState(() => lactoseFree = newValue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

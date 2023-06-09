import 'package:flutter/material.dart';
import 'package:food/widget/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favorites;
  final Function toggleLike;
  final Function isFavorite;
  const FavoritesScreen(
      {super.key,
      required this.favorites,
      required this.toggleLike,
      required this.isFavorite});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _toggleLike(String mealId) {
    setState(() {
      widget.toggleLike(mealId);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Taom o'chirildi"),
        action: SnackBarAction(
          label: 'BEKOR QILISH',
          onPressed: () {
            setState(() {
              widget.toggleLike(mealId);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.favorites.length > 0
        ? ListView.builder(
            padding: EdgeInsets.all(15),
            itemCount: widget.favorites.length,
            itemBuilder: (ctx, index) => MealItem(
              meal: widget.favorites[index],
              toggleLike: _toggleLike,
              isFavorite: widget.isFavorite,
            ),
          )
        : const Center(
            child: Text("Sevimli taomlar yo'q!"),
          );
  }
}

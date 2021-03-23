import 'package:daily_recipe/models/rate.dart';

/// `Recipe` object model
class Recipe {
  String name;
  String foodType;
  Rate rate;
  int calories;
  int preparationTime;
  int serving;
  String imagePath;
  bool like;

  // Constructor
  Recipe({
    this.name,
    this.foodType,
    this.rate,
    this.calories,
    this.preparationTime,
    this.serving,
    this.imagePath,
    this.like = false
  });
}

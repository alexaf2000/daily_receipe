import 'package:daily_recipe/models/rate.dart';

/// `Recipe` object model
class Recipe {
  String name;
  String foodType;
  Rate rate;
  int calories;
  Duration preparationTime;

  // Constructor
  Recipe({
    this.name,
    this.foodType,
    this.rate,
    this.calories,
    this.preparationTime,
  });
}

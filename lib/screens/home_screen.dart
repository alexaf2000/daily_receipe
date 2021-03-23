import 'package:daily_recipe/models/rate.dart';
import 'package:daily_recipe/models/recipe.dart';
import 'package:daily_recipe/providers/auth_provider.dart';
import 'package:daily_recipe/widgets/base/custom_app_bar.dart';
import 'package:daily_recipe/widgets/recipe/recipe_lite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> recommendedRecipes;

  @override
  void initState() {
    // Set the variables
    recommendedRecipes = [
      new Recipe(
          name: "French Toast with Berries",
          calories: 120,
          foodType: "Breakfast",
          preparationTime: 10,
          serving: 1,
          imagePath: "assets/images/food/food_1.png",
          rate: new Rate(puntuation: 5)),
      new Recipe(
          name: "Glazed Salmon",
          calories: 50,
          foodType: "Main Dish",
          preparationTime: 45,
          serving: 2,
          like: true,
          imagePath: "assets/images/food/food_2.png",
          rate: new Rate(puntuation: 3)),
      new Recipe(
          name: "Asian Glazed Chicken Thigts",
          calories: 120,
          foodType: "Breakfast",
          preparationTime: 10,
          serving: 1,
          imagePath: "assets/images/food/food_3.png",
          rate: new Rate(puntuation: 5)),
      new Recipe(
          name: "French Toast with Berries",
          calories: 120,
          foodType: "Breakfast",
          preparationTime: 10,
          serving: 1,
          imagePath: "assets/images/food/food_4.png",
          rate: new Rate(puntuation: 5)),
      new Recipe(
          name: "French Toast with Berries",
          calories: 120,
          foodType: "Breakfast",
          preparationTime: 10,
          serving: 1,
          imagePath: "assets/images/food/food_5.png",
          rate: new Rate(puntuation: 5))
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: CustomAppBar(actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/notifications.svg'),
          )
        ]),
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello ${authProvider.authenticatedUser.email}"),
                        Text("What would you like to cook today?",
                            style: TextStyle(
                                fontFamily: "AbrilFatFace", fontSize: 24)),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Recommended",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800)),
                              Text("See All",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFF55A00)))
                            ]),
                        SizedBox(height: 10),
                        Expanded(
                          child: ListView.separated(
                            itemCount: recommendedRecipes.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 20);
                            },
                            itemBuilder: (context, index) {
                              return RecipeLiteCard(
                                  recipe: recommendedRecipes[index]);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}

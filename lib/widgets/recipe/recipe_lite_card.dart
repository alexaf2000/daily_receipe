import 'package:daily_recipe/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecipeLiteCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeLiteCard({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFF7F8FC),
        ),
        child: Row(children: [
          Container(child: Image.asset(recipe.imagePath), width: 80),
          SizedBox(width: 10),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recipe.foodType,
                      style: TextStyle(color: Color(0xFF128FAE))),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(recipe.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  Text("${recipe.calories.toString()} calories",
                      style: TextStyle(color: Color(0xFFF55A00))),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/time.svg'),
                      SizedBox(width: 5),
                      Text("${recipe.preparationTime} minuts",
                          style: TextStyle(color: Color(0xFFB6B9C2))),
                      SizedBox(width: 10),
                      SvgPicture.asset('assets/icons/serving.svg'),
                      SizedBox(width: 5),
                      Text("${recipe.serving}",
                          style: TextStyle(color: Color(0xFFB6B9C2)))
                    ],
                  )
                ]),
          ),
          Align(alignment: Alignment.topCenter, child: SvgPicture.asset("assets/icons/heart" +
              (recipe.like == false ? '-outline.svg' : '.svg')))
        ]));
  }
}

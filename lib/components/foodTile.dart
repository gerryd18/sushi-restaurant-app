import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_restaurant/models/food.dart';
import 'package:sushi_restaurant/theme/colors.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .5,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(25),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //imaged
              Center(
                child: Image.asset(
                  food.imagePath,
                  height: 100,
                ),
              ),

              const SizedBox(height: 20),

              //text
              Text(
                food.name,
                style: GoogleFonts.poppins(fontSize: 20),
              ),

              //price + rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  Text(
                    '\$' + food.price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkColor,
                    ),
                  ),

                  //rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                      Text(
                        food.rating,
                        style: TextStyle(color: lightPrimaryColor),
                      ),
                    ],
                  )
                ],
              )
            ]),
      ),
    );
  }
}

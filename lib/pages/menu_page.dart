import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";
import "package:sushi_restaurant/components/button.dart";
import "package:sushi_restaurant/components/foodTile.dart";
import "package:sushi_restaurant/models/food.dart";
import "package:sushi_restaurant/models/shop.dart";
import "package:sushi_restaurant/pages/food_details.dart";
import "package:sushi_restaurant/theme/colors.dart";

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //navigate to food item detail page
  void navigateToDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(food: foodMenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 239, 219),
      appBar: AppBar(
        foregroundColor: Colors.grey[900],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'Tokyo',
        ),
        actions: [
          //cart button
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartPage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get 50% Promo',
                      style: GoogleFonts.poppins(fontSize: 20, color: bgColor),
                    ),
                    const SizedBox(height: 29),
                    MyButton(text: 'Redeem', onTap: () {})
                  ],
                ),

                //image
                Image.asset(
                  'lib/images/sushi2.png',
                  height: 100,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search..",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: lightPrimaryColor2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                color: darkColor,
                fontSize: 20,
              ),
            ),
          ),

          const SizedBox(height: 25),

          // popular food
          // Expanded(
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: foodMenu.length,
          //     itemBuilder: (context, index) => FoodTile(
          //       food: foodMenu[index],
          //       onTap: () {},
          //     ),
          //   ),
          // ),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () {
                  navigateToDetails(index);
                },
              ),
            ),
          ),

          const SizedBox(height: 25),

          //popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //image
                Row(
                  children: [
                    Image.asset(
                      'lib/images/nigiri.png',
                      height: 60,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Salmon Eggs',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '\$21.00',
                          style: TextStyle(color: lightPrimaryColor),
                        )
                      ],
                    ),
                  ],
                ),

                Icon(
                  Icons.favorite_outline,
                  color: lightPrimaryColor,
                  size: 28,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sushi_restaurant/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: "Salmon Sushi",
      price: '20000',
      imagePath: 'lib/images/sushi.png',
      rating: '4,5',
    ),
    Food(
      name: "tuna Sushi",
      price: '22000',
      imagePath: 'lib/images/sushi2.png',
      rating: '4,9',
    ),
  ];

  //customer cart
  List<Food> _cart = [];

  //getter
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCard(Food foodItem, int qty) {
    for (var i = 0; i < qty; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart

  void removeCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_app/models/Coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
        name: 'Hot Americano',
        price: "\$5",
        imagePath: "assets/images/expresso.png"),
    Coffee(
        name: ' Hot Latte', price: "\$6", imagePath: "assets/images/latte.png"),
    Coffee(
        name: 'Hot Mocha', price: "\$7", imagePath: "assets/images/mocha.png"),
    Coffee(
        name: 'Iced Coffee',
        price: "\$6.50",
        imagePath: "assets/images/cold-coffee.png")
  ];
  // user Cart
  List<Coffee> _userCart = [];
  // get Coffee list
  List<Coffee> get coffeeShop => _shop;
  // get user Cart
  List<Coffee> get userCart => _userCart;
  // add item to cart

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(coffee) {
    log(_userCart.length);

    _userCart.remove(coffee);
    notifyListeners();
  }
}

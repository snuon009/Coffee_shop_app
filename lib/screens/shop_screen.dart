import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:test_app/components/coffee_tile.dart';
import 'package:test_app/models/Coffee_Shop.dart';
import 'package:test_app/models/Coffee.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  //add to cart
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Sucessfully added to cart!"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(children: [
                  const Text("Choose your favourite drink!"),
                  const SizedBox(
                    height: 25,
                  ),
                  // list of coffee to buy
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.coffeeShop.length,
                          itemBuilder: (context, index) {
                            // get individual coffee
                            Coffee eachCoffee = value.coffeeShop[index];

                            // get the tile for each
                            return CoffeeTile(
                              coffee: eachCoffee,
                              onPressed: () => addToCart(eachCoffee),
                              icon: Icon(Icons.add),
                            );
                          }))
                ]),
              ),
            ));
  }
}

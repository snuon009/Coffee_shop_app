import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/components/coffee_tile.dart';
import 'package:test_app/models/Coffee_Shop.dart';
import 'package:test_app/models/Coffee.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    void removeFromCart(Coffee coffee) {
      Provider.of<CoffeeShop>(context, listen: false)
          .removeItemFromCart(coffee);
    }

    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Expanded(
                child: (value.userCart.isEmpty)
                    ? Center(child: Text("No item in cart !"))
                    : ListView.builder(
                        itemCount: value.userCart.length,
                        itemBuilder: (context, index) {
                          if (index < value.coffeeShop.length) {
                            Coffee eachCoffee = value.coffeeShop[index];

                            return CoffeeTile(
                                coffee: eachCoffee,
                                onPressed: () => removeFromCart(eachCoffee),
                                icon: Icon(Icons.delete));
                          }
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

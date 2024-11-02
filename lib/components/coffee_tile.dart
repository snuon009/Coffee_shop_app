import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test_app/models/Coffee.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final Widget icon;
  void Function()? onPressed;
  CoffeeTile(
      {super.key,
      required this.coffee,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
          title: Text(coffee.name),
          subtitle: Text(coffee.price),
          leading: Image.asset(coffee.imagePath),
          trailing: IconButton(
              icon: icon,
              style: IconButton.styleFrom(
                  backgroundColor: Colors.cyan.shade400,
                  foregroundColor: Colors.white),
              onPressed: onPressed)),
    );
  }
}

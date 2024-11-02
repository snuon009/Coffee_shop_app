import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:test_app/const.dart';
import 'package:test_app/models/Coffee_Shop.dart';
import 'package:badges/badges.dart' as badges;

class BottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => Container(
        margin: EdgeInsets.all(25),
        child: GNav(
            onTabChange: (value) => onTabChange!(value),
            color: Colors.grey,
            mainAxisAlignment: MainAxisAlignment.center,
            //tabBackgroundColor: Colors.grey.shade300,
            tabBorderRadius: 20,
            //activeColor: const Color.fromARGB(255, 4, 64, 72),
            tabBackgroundColor: Colors.white,
            duration: Duration(milliseconds: 900),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Shop',
              ),
              GButton(
                  icon: Icons.shopping_bag_outlined,
                  leading: badges.Badge(
                    child: Icon(Icons.settings),
                    badgeContent: Text('3'),
                  ),
                  haptic: true,
                  text: 'Cart')
            ]),
      ),
    );
  }
}

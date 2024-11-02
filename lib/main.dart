import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/const.dart';
import 'package:test_app/components/bottom_nav_bar.dart';
import 'package:test_app/models/Coffee_Shop.dart';
import 'package:test_app/screens/cart_screen.dart';
import 'package:test_app/screens/shop_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int _selectedIndex = 0;
  navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // page
  final List<Widget> _screens = [ShopScreen(), CartScreen()];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CoffeeShop(),
        builder: (context, child) => MaterialApp(
              title: "Flutter app",
              debugShowCheckedModeBanner: false,
              //theme: ThemeData.dark(),
              home: Scaffold(
                backgroundColor: backgroundColor,
                bottomNavigationBar: BottomNav(
                  onTabChange: (index) => navigateBottomBar(index),
                ),
                appBar: AppBar(
                  backgroundColor: brandedColor,
                  iconTheme: IconThemeData(color: Colors.white),
                  title: Text(
                    "Tasty Cafe",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                endDrawer: Drawer(
                  backgroundColor: backgroundColor,
                ),
                body: _screens[_selectedIndex],
              ),
            ));
  }
}

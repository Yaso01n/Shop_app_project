// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './Login_Page.dart';
import './Home_Page.dart';
import './Cart_Page.dart';
import './Favourite_Page.dart';
import './Navigation_Bar.dart';
import 'Product_Details_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'logg': (context) => Loginpage(),
        'home': (context) => MyHomePage(),
        'cart': (context) => Cartpage(),
        'fav': (context) => FavPage(),
        '/bar': (context) => MyNavigationBar(),
        'detail': (context) => DetailsPage(),
      },
      initialRoute: 'logg',
    );
  }
}

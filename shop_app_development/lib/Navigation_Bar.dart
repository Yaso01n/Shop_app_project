// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import './Cart_Page.dart';
import './Favourite_Page.dart';
import './Home_Page.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;

  List<Widget> pagechosen = [
    MyHomePage(),
    FavPage(),
    Cartpage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Clothes Store',
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.purple[800],
        ),
        body: pagechosen.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purple[800],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp),
              label: 'fav',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp),
              label: 'cart',
            )
          ],
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.white,
          iconSize: 40,
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ));
  }
}

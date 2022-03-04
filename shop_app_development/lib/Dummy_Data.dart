// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';

class Product {
  static int currentID = 0;
  String image;
  String productName;
  int productId = currentID;
  String description;
  double price;
  bool fav = false;
  bool cart = false;
  Product(
      {required this.image,
      required this.productName,
      required this.description,
      required this.price}) {
    currentID = currentID + 1;
  }
}

class DummyData with ChangeNotifier {
  static List<Product> product = [
    Product(
        image: "assets/1.jpg",
        productName: 'FLORAL SQUARE NECK MINI DRESS',
        description:
            "It's all in the details - like cute spring florals and tie-up sleeves. Make it yours!",
        price: 550),
    Product(
        image: "assets/2.jpg",
        productName: 'PUFF-SLEEVE WRAP DRESS',
        description: "Get caught in the sun in this wrap dress!",
        price: 425),
    Product(
        image: "assets/3.jpg",
        productName: 'LONG SLEEVE WRAP DRESS',
        description: 'Product dimensions	47D x 47W x 90H centimeters',
        price: 770),
    Product(
        image: "assets/4.jpg",
        productName: 'KNIT MAXI SLIP DRESS',
        description:
            'The layering possibilities are endless with this soft cotton maxi dress with an airy side slit.',
        price: 450),
    Product(
        image: "assets/5.jpg",
        productName: 'CORDUROY OVERALL MINI DRESS',
        description: 'Case Wide: 50mmCase thickness: 14mm Band wide: 22mm',
        price: 520),
    Product(
        image: "assets/6.jpg",
        productName: 'DENIM BUTTON-UP BABYDOLL SHIRT DRESS',
        description:
            'Fall essentials are here! Our best babydoll dress meets our soft wash denim for a look and feel you wll love.',
        price: 470),
    Product(
        image: "assets/7.jpg",
        productName: 'SHIFT MINI DRESS',
        description:
            'Comfort meets style in an easy shift dress, for wherever you wander.',
        price: 425),
    Product(
        image: "assets/8.jpg",
        productName: 'KNIT BABYDOLL DRESS',
        description:
            'Super trendy babydoll silhouette meets soft knit cotton for a look.',
        price: 439),
    Product(
        image: "assets/9.jpg",
        productName: 'FLUTTER-SLEEVE MINI DRESS',
        description:
            'This soft mini is full of girl power and features flutter sleeves for a feminine look we love.',
        price: 400),
    Product(
        image: "assets/10.jpg",
        productName: 'LONG SLEEVE SMOCKED MIDI DRESS',
        description:
            'The prettiest way to be comfy, this midi dress has a stretchy smocked bodice and easy midi length that’ll take you anywhere.',
        price: 840),
    Product(
        image: "assets/11.jpg",
        productName: 'PLAID BABYDOLL SHIRT DRESS',
        description: 'Case Wide: 50mmCase thickness: 14mm Band wide: 22mm',
        price: 420),
    Product(
        image: "assets/12.jpg",
        productName: 'SHIRT MINI DRESS',
        description: 'This dress is like your fave button-up but better!',
        price: 410),
    Product(
        image: "assets/13.jpg",
        productName: 'LONG SLEEVE TRAPEZE MINI DRESS',
        description:
            'Let loose in this trapeze-style mini in cooler-than-cool black denim.',
        price: 860),
    Product(
        image: "assets/14.jpg",
        productName: 'FLUTTER-SLEEVE MINI DRESS',
        description:
            'Wrap yourself in ruffles for a pretty, wear-anywhere look.',
        price: 500),
    Product(
        image: "assets/15.jpg",
        productName: 'UTILITY LAYERING DRESS',
        description:
            'Cool, utility-inspired details make this mini the perfect piece to wear solo or layer over your fave cozy top.',
        price: 980),
  ];
}

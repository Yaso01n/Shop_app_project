// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_development/Custom_Card.dart';
import './Dummy_Data.dart';
import './Cart_Page.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);
  @override
  State<FavPage> createState() => _FavPage();
}

class _FavPage extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavProvider>(context, listen: false);
    return ListView.builder(
        itemCount: fav.favProducts.length,
        itemBuilder: (context, i) {
          return CustomCard(
            fav: fav.favProducts[i].fav,
            cart: fav.favProducts[i].cart,
            productName: fav.favProducts[i].productName,
            price: fav.favProducts[i].price,
            image: fav.favProducts[i].image,
            onPressingFav: () {
              setState(() {
                fav.favProducts[i].fav =
                    fav.favProducts[i].fav == true ? false : true;
                Provider.of<FavProvider>(context, listen: false)
                    .Favourites(fav.favProducts[i]);
              });
            },
            onPressingcard: () {
              setState(() {
                Navigator.of(context).pushNamed('detail', arguments: i);
              });
            },
            onpressingcartproduct: () {
              setState(() {
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(DummyData.product[i]);
              });
            },
          );
        });
  }
}

class FavProvider extends ChangeNotifier {
  List<Product> favProducts = [];
  // ignore: non_constant_identifier_names
  void Favourites(Product product) {
    if (product.fav) {
      favProducts.insert(0, product);
      notifyListeners();
    } else {
      favProducts.remove(product);
      notifyListeners();
    }
  }
}

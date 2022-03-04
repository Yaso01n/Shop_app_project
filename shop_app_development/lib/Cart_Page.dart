// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Dummy_Data.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);
  @override
  State<Cartpage> createState() => _Cartpage();
}

class _Cartpage extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return ListView.builder(
        itemCount: cart.cartProducts.length,
        itemBuilder: (context, index) {
          return CartWidget(
              product: cart.cartProducts[index],
              onpressingdelete: () {
                setState(() {
                  Provider.of<CartProvider>(context, listen: false)
                      .removeFromCart(cart.cartProducts[index]);
                });
              });
        });
  }
}

class CartProvider extends ChangeNotifier {
  List<Product> cartProducts = [];
  void addToCart(Product product) {
    cartProducts.insert(0, product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cartProducts.remove(product);
    notifyListeners();
  }
}

class CartWidget extends StatelessWidget {
  final Product? product;
  final Function onpressingdelete;
  // ignore: use_key_in_widget_constructors
  const CartWidget({
    @required this.product,
    required this.onpressingdelete,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(child: Image.asset(product!.image)),
          ),
          title: Text(product!.productName),
          subtitle: Text('Total : ${product!.price} LE'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              onpressingdelete();
            },
          ),
        ),
      ),
    );
  }
}

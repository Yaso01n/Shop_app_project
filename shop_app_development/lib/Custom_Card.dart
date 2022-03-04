// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
//import 'Dummy Data.dart';

class CustomCard extends StatelessWidget {
  final bool fav;
  final bool cart;
  final productName;
  final double price;
  final String image;
  final Function onPressingFav;
  final Function onPressingcard;
  final Function onpressingcartproduct;
  const CustomCard({
    required this.fav,
    required this.cart,
    required this.productName,
    required this.price,
    required this.image,
    required this.onPressingFav,
    required this.onPressingcard,
    required this.onpressingcartproduct,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onPressingcard(),
        child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Image.asset(
                        image,
//why does not it fit ??? -------------
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: InkWell(
                          onTap: () {
                            onPressingFav();
                          },
                          child: Icon(
                            Icons.favorite_sharp,
                            color: fav == true ? Colors.red : Colors.black45,
                            size: 60,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //----------------------------------------------------------------------------
                Expanded(
                  flex: 1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: Text(
                            productName,
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 18, bottom: 2),
                          child: Text(
                            '$price EGP',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                              onTap: () => onpressingcartproduct(),
                              child: Icon(
                                Icons.shopping_cart_sharp,
                                size: 35,
                                color: Colors.blueGrey[300],
                              )),
                        ),
                      ]),
                )
              ]),
            )));
  }
}

// ignore_for_file: must_be_immutable, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import './Dummy_Data.dart';
import './Custom_Card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Expanded(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: DummyData.product.length,
          itemBuilder: (BuildContext context, int i) {
            return CustomCard(
                fav: DummyData.product[i].fav,
                productName: DummyData.product[i].productName,
                price: DummyData.product[i].price,
                image: DummyData.product[i].image,
                onPressingFav: () {
                  setState(() {
                    DummyData.product[i].fav =
                        DummyData.product[i].fav == true ? false : true;
                  });
                },
                onPressingcard: () {
                  setState(() {
                    Navigator.of(context).pushNamed('detail', arguments: i);
                  });
                });
          },
        ),
      ),
    );
  }
}

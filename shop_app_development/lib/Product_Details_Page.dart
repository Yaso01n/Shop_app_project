// ignore_for_file: must_be_immutable, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import './Dummy_Data.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPage();
}

class _DetailsPage extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
//getting the width and height of the mobile to avoid overflow
    double screenHight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    int cardnumber = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Product Details',
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.purple[800],
        ),
        body: Container(
          color: Colors.purple[100],
          width: screenWidth,
          height: screenHight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      color: Colors.purple,
                      alignment: Alignment.center,
                      child: Text(
                        DummyData.product[cardnumber].productName,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ))),
              Expanded(
                  flex: 4,
                  child:
//There is a problem here : The photo do not fill the area and the favourite do not move to the left
                      Stack(
                    children: [
                      Image.asset(
                        DummyData.product[cardnumber].image,
                      ),
                      Positioned(
                          top: 5,
                          right: 5,
                          child: Text(
                            '${DummyData.product[cardnumber].price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )),
                      Positioned(
                        bottom: 2,
                        left: 5,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              DummyData.product[cardnumber].fav =
                                  DummyData.product[cardnumber].fav == true
                                      ? false
                                      : true;
                            });
                          },
                          child: Icon(
                            Icons.favorite_sharp,
                            color: DummyData.product[cardnumber].fav == true
                                ? Colors.red
                                : Colors.black45,
                            size: 60,
                          ),
                        ),
                      )
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                      color: Colors.purple,
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Describtion:    ${DummyData.product[cardnumber].description}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ))),
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      side: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/bar');
                    },
                    child: Text('Back'),
                  )),
            ],
          ),
        ));
  }
}

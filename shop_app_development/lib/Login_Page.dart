// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Loginpage();
}

class _Loginpage extends State<Loginpage> {
  String signupmessage = '';
  bool email = false;

//checking if the input email is correct, then entering the home page.
  set(bool input) {
    email = input;
  }

  bool get() {
    return email;
  }

//username Data
  final myController1 = TextEditingController();
  String inputName = '';

//password Data
  var secure = true;
  final myController2 = TextEditingController();
  String inputPassword = '';

//list of emails => (username: password)
  Map<String, String> emails = {
    'Yasmine': '123679b',
    'Shrouk': '56790kjh',
    'Asmaa': 'gfdd3567',
    'Sara': 'uty5678',
    'Noha': '780nj45',
    'Mariam': 'hg54390',
    'Zainab': '4679kmr',
    'Yara': 'mnhf654',
    'Mayar': 'hgtr678',
    'Toka': '5680jhy'
  };

//checking input Status
  String checktext = '';
  checkinputs(String user, String pass) {
    setState(() {
      if (emails.containsKey(user) && emails[user] == pass) {
        checktext = 'Login Successfully';
        set(true);
      } else {
        if (emails.containsKey(user) && (!(emails[user] == pass))) {
          checktext = 'Invalid Password';
        } else {
          if ((!emails.containsKey(user)) && emails.containsValue(pass)) {
            checktext = 'Invalid username';
          } else {
            checktext = 'Invalid Username and Password';
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
//getting the width and height of the mobile to avoid overflow
    double screenHight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Colors.purple[600],
              width: screenWidth,
              height: screenHight,
              child: Column(
                children: [
//----------------------------------------------------------
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Container(
                      color: Colors.purple[600],
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: ListTile(
                        title: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Welcome To Our Beloved Shop',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
//-----------------------------------------------------------
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 4,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //---------------------------------------------------------
                            Container(
                              padding: EdgeInsets.all(20.0),
                              margin: EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                checktext,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            //------------------------------------------------------------
                            TextField(
                              maxLength: 10,
                              decoration: InputDecoration(
                                hintText: 'Write your username',
                                labelText: "UserName",
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.person),
                              ),
                              controller: myController1,
                            ),
                            //--------------------------------------------------------------
                            TextField(
                              obscureText: secure,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: 'Write your Password',
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.lock_outline_rounded),
                                    onPressed: () {
                                      setState(() {
                                        if (secure == true) {
                                          secure = false;
                                        } else {
                                          secure = true;
                                        }
                                      });
                                    },
                                  )),
                              maxLength: 10,
                              controller: myController2,
                            ),
                            //-----------------------------------------------------------------
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        myController2.text = '';
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(
                                          bottom: 20.0, right: 15.0),
                                    ),
                                    child: Text(
                                      'Reset Password',
                                      style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 18,
                                      ),
                                    ))
                              ],
                            ),
                            //-----------------------------------------------------------------
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                //-----------------------------------------------
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightBlue,
                                    onPrimary: Colors.white,
                                    padding: EdgeInsets.all(25.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    shadowColor: Colors.black,
                                  ),
                                  child: Text(
                                    'SignUp',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      signupmessage =
                                          'Please wait For Version 2';
                                    });
                                  },
                                ),
                                //-------------------------------------------------
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightBlue,
                                    onPrimary: Colors.white,
                                    padding: EdgeInsets.all(25.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    shadowColor: Colors.black,
                                  ),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  onPressed: () {
                                    inputName = myController1.text;
                                    inputPassword = myController2.text;
                                    checkinputs(inputName, inputPassword);
                                    if (get()) {
                                      Navigator.of(context).pushNamed('/bar');
                                    }
                                  },
                                ),
                              ],
                            ),
//-------------------------------------------------------------------
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.all(5.0),
                              child: Text(
                                signupmessage,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            )));
  }
}

import 'package:enlacessp/pages/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class logIn extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bgMaterialBlue.png',
                    ),
                    fit: BoxFit.cover,
                    repeat: ImageRepeat.noRepeat)),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 450,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: FadeAnimation(
                            1.5,
                            SizedBox(
                              width: 300,
                              child: Container(
                                margin: EdgeInsets.only(top: 50),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/SSPLOGO.png'))),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(29, 43, 82, .5),
                                  blurRadius: 8.0,
                                  offset: Offset(0, 5))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(border: Border()),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Usuario",
                                    suffixIcon: Icon(Icons.account_circle,
                                        color: Color.fromRGBO(29, 43, 82, 3)),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Contraseña",
                                    suffixIcon: Icon(Icons.lock,
                                        color: Color.fromRGBO(29, 43, 82, 3)),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                                obscureText: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          2,
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(29, 43, 82, 3),
                                  Color.fromRGBO(29, 43, 82, 3),
                                ])),
                            child: FlatButton(
                              child: Text(
                                "Continuar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                //_login();
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                              },
                            ),
                          )),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int text = 0;
  double height = 0;
  double weight = 0;
  int calculateBMI(double thisheight, double thisweight) {
    if (thisheight == 0 || thisweight == 0) {
      return 0;
    } else {
      double heightinm = thisheight / 100;
      double heightSquare = heightinm * heightinm;
      double result = thisweight / heightSquare;
      return result.round();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 40),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(overflow: Overflow.visible, children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.6,
          left: MediaQuery.of(context).size.width - 110,
          child: RotationTransition(
            child: Icon(
              Icons.favorite,
              size: 100,
              color: Colors.red,
            ),
            turns: AlwaysStoppedAnimation(15 / 360),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          left: 10,
          child: RotationTransition(
            child: Icon(
              Icons.fitness_center,
              size: 100,
              color: Colors.orange,
            ),
            turns: AlwaysStoppedAnimation(15 / 360),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.6 - 100,
          left: MediaQuery.of(context).size.width * 0.4 - 100,
          child: RotationTransition(
            child: Icon(
              Icons.emoji_emotions_outlined,
              size: 100,
              color: Colors.blue,
            ),
            turns: AlwaysStoppedAnimation(-30 / 360),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Weight",
                        style: TextStyle(
                          fontFamily: "Display Font",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        onChanged: (String value) {
                          if (value == "") {
                            setState(() {
                              weight = 0;
                              height = 0;
                            });
                          } else {
                            setState(() {
                              weight = double.parse(value);
                              height = height;
                            });
                          }
                        },
                        cursorColor: Colors.black,
                        textAlign: TextAlign.center,
                        cursorHeight: 20,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontFamily: "Digital Font",
                            fontSize: 20,
                            color: Colors.black),
                        decoration: const InputDecoration(
                          hintText: "0 kg",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Height",
                        style: TextStyle(
                          fontFamily: "Display Font",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        onChanged: (String value) {
                          if (value == "") {
                            setState(() {
                              weight = 0;
                              height = 0;
                            });
                          } else {
                            setState(() {
                              height = double.parse(value);
                              weight = weight;
                            });
                          }
                        },
                        cursorColor: Colors.black,
                        textAlign: TextAlign.center,
                        cursorHeight: 20,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontFamily: "Digital Font",
                            fontSize: 20,
                            color: Colors.black),
                        decoration: const InputDecoration(
                          hintText: "0 kg",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 130),
                  child: Text(
                    "Your BMI is...",
                    style: TextStyle(
                      fontFamily: "Display Font",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    calculateBMI(weight, height).toString(),
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontFamily: "Display Font",
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

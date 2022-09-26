// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'dart:math';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool darkMode = false;
  String location = 'assets/moon.png';
  Color textcolor = Colors.black;
  Color hintcolor = Colors.grey;
  Color bgcolor = Colors.white;
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  String text1 = "1";
  @override
  void initState() {
    super.initState();
    textEditingController1 = TextEditingController(text: "1");
    textEditingController2 = TextEditingController(text: "100");
  }

  int randomNumber(int min, int max) {
    Random rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    return r;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        title: Text(
          "Random Number Generator",
          style: TextStyle(color: textcolor, fontSize: 22),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  darkMode = darkMode == true ? false : true;
                  hintcolor =
                      hintcolor == Colors.grey ? Colors.white60 : Colors.grey;
                  textcolor =
                      textcolor == Colors.white ? Colors.black : Colors.white;
                  bgcolor =
                      textcolor == Colors.black ? Colors.white : Colors.black;
                  location = location == 'assets/moon.png'
                      ? 'assets/sun.png'
                      : 'assets/moon.png';
                });
              },
              child: Image.asset(
                location,
                scale: width / 18,
              ),
              // child: Icon(
              //   Icons.wb_sunny_rounded,
              //   size: 28,
              //   color: Colors.black,
              // ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  //color: Colors.amber,
                  width: width - 10,
                  height: width / 2,
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        text1,
                        style: TextStyle(
                            fontFamily: 'Open_Sans', color: textcolor),
                      )),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: textEditingController1,
                              style: TextStyle(color: textcolor, fontSize: 24),
                              decoration: InputDecoration(
                                labelText: "Min",
                                labelStyle:
                                    TextStyle(color: hintcolor, fontSize: 24),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 1.5, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 1.5, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: textEditingController2,
                              style: TextStyle(
                                color: textcolor,
                                fontSize: 22,
                              ),
                              decoration: InputDecoration(
                                labelText: "Max",
                                labelStyle:
                                    TextStyle(color: hintcolor, fontSize: 24),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 1.5, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 1.5, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      int min = int.parse(textEditingController1.text);
                      int max = int.parse(textEditingController2.text);
                      try {
                        text1 = (min + Random().nextInt(max - min)).toString();
                      } catch (e) {
                        text1 = "1";
                      }
                    });
                  },
                  child: Container(
                    width: width - 10,
                    height: width * 0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "Generate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

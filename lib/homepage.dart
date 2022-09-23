// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:random_number/randomnumber.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool darkMode = false;
  Color textcolor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.black,
          //titleTextStyle: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(),
        //text
      ),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
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
                    textcolor =
                        textcolor == Colors.white ? Colors.black : Colors.white;
                  });
                },
                child: Icon(
                  Icons.wb_sunny_rounded,
                  size: 28,
                  color: Colors.black,
                ),
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
        ),
        body: SafeArea(
          child: RandomNumber(),
        ),
      ),
    );
  }
}

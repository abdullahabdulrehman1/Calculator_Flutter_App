import 'package:calculator/util/dimensions.dart';
import 'package:calculator/widgets/circular_avatar.dart';
import 'package:calculator/widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

 class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              
                child: Container(
                  width: double.infinity,
              padding: EdgeInsets.all(12),
              color: Colors.red,
              child: Column(children: [],),
            )),
            Row(
              children: [
                button(
                    digit: "AC",
                    backgroundcolor: operatorcolor,
                    textcolor: orangecolor),
                button(
                    digit: "<",
                    backgroundcolor: operatorcolor,
                    textcolor: orangecolor),
                button(digit: "", backgroundcolor: Colors.transparent),
                button(
                    digit: "/",
                    backgroundcolor: operatorcolor,
                    textcolor: orangecolor),
              ],
            ),
            Row(
              children: [
                button(digit: "7"),
                button(digit: "8"),
                button(digit: "9"),
                button(
                    digit: "x",
                    backgroundcolor: operatorcolor,
                    textcolor: orangecolor),
              ],
            ),
            Row(
              children: [
                button(digit: "4"),
                button(digit: "5"),
                button(digit: "6"),
                button(
                    digit: "-",
                    backgroundcolor: operatorcolor,
                    textcolor: orangecolor),
              ],
            ),
            Row(
              children: [
                button(digit: "1"),
                button(digit: "2"),
                button(digit: "3"),
                button(
                    digit: "+",
                    backgroundcolor: operatorcolor,
                    textcolor: orangecolor),
              ],
            ),
            Row(
              children: [
                button(digit: "%"),
                button(digit: "0"),
                button(
                    digit: ".",
                    backgroundcolor: operatorcolor,
                    textcolor: orangecolor),
                button(
                    digit: "=",
                    backgroundcolor: orangecolor,
                    textcolor: operatorcolor),
              ],
            ),
          ],
        ));
  }
}

Widget button(
    {backgroundcolor = buttoncolor, textcolor = Colors.white, digit}) {
  return Expanded(
      child: Container(
        width: double.infinity,
    margin: EdgeInsets.all(8),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(22),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: backgroundcolor),
      onPressed: () {},
      child: Text(
        digit,
        style: TextStyle(
            fontSize: Dimension.font20, color: textcolor, fontWeight: FontWeight.bold),
      ),
    ),
  ));
}

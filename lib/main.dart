// import 'dart:html';
import './util/global_variables.dart';
import 'package:calculator/util/dimensions.dart';
// import 'package:calculator/widgets/circular_avatar.dart';
import 'package:calculator/widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

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
    return const GetMaterialApp(
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
    //Button Function tells what if <,= and AC pressed
    onButtonclick(value) {
      if (value == "AC") {
        input = '';
        output = '';
      } else if (value == "<") {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (value == "=") {
        if (input.isNotEmpty) {
          //Algorithm that tells .....
          //userinput the input that is inserted by user is here
          var userinput = input;
          //we need to replace x with * beacuse math expression multiplication sign is * not the x
          userinput = userinput.replaceAll("x", "*");

          //tryinitialize the parser to read !
          try {
            Parser p = Parser();
            //now parse the user input using expression
            Expression expression = p.parse(userinput);
            ContextModel cm = ContextModel();
            //getting the final value
            var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
            //Converting output to string because output store string
            output = finalvalue.toString();
            //if the output end with .0 then its length should be cut off using -2
            if (output.endsWith(".0")) {
              output = output.substring(0, output.length - 2);
            }
          } catch (e) {
            output = "";
          }
        }
        //this show input is will ultimately became output so that user c an edit the result
        input = output;
      } else {
        input = input + value;
      }

      setState(() {});
    }

//var userinput = input;
//userinput = userinput.
// paerser p = Parser ();
// expression e = p.parse(userinput);
// context model cm= context mode();
// final value - expression.evalutate (Evaltueteot.real, cm)

//button method for each button
    Widget button(
        {backgroundcolor = buttoncolor, textcolor = Colors.white, digit}) {
      return Expanded(
          // flex: 0,
          child: Container(
        // width: double.infinity,
        margin: EdgeInsets.symmetric(
            horizontal: Dimension.height10, vertical: Dimension.height30 / 7),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 5,
              padding: EdgeInsets.all(Dimension.height20 * 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimension.height10)),
              backgroundColor: backgroundcolor),
          onPressed: () => onButtonclick(digit),
          child: Text(
            digit,
            style: TextStyle(
                fontSize: Dimension.font20,
                color: textcolor,
                fontWeight: FontWeight.w800),
          ),
        ),
      ));
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            //input output section
            Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: Dimension.height45),
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  // physics:AlwaysScrollableScrollPhysics(),
                  // restorationId:AutofillHints.addressCity,
                  // keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.manual,
                  child: Container(
                    margin: EdgeInsets.only(top: Dimension.height45 * 4),
                    // height: Dimension.height20,
                    // height: 200,x
                    width: double.maxFinite,
                    padding: EdgeInsets.all(Dimension.height10),

                    color: Colors.black54,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          input,
                          style: TextStyle(
                              fontSize: Dimension.font24 * 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: Dimension.height10,
                        ),
                        Text(
                          output,
                          style: TextStyle(
                              fontSize: Dimension.font20 * 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.7)),
                        ),
                        SizedBox(
                          height: Dimension.height10,
                        ),
                      ],
                    ),
                  ),
                )),
            //butttons section
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                        color: Colors.white.withOpacity(0.7),
                        width: 1,
                        style: BorderStyle.solid),
                    vertical: BorderSide.none,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                    SizedBox(
                      height: Dimension.height10 * 1.5,
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
                    SizedBox(
                      height: Dimension.height10 * 1.5,
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
                    SizedBox(
                      height: Dimension.height10 * 1.5,
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
                    SizedBox(
                      height: Dimension.height10 * 1.5,
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
                ),
              ),
            ),
          ],
        ));
  }
}

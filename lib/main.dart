import 'package:calculator/util/dimensions.dart';
import 'package:calculator/widgets/circular_avatar.dart';
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
  double firstnum = 0.0;
  double secondnum = 0.0;
  var input = "";
  var output = "";
  var operation = "";

  @override
  Widget build(BuildContext context) {
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
          var userinput = input;
          userinput = userinput.replaceAll("x", "*");
          Parser p = Parser();
          Expression expression = p.parse(userinput);
          ContextModel cm = ContextModel();
          var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
          output = finalvalue.toString();
          if (output.endsWith(".0")) {
            output = output.substring(0, output.length - 2);
          }
        }
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
    Widget button(
        {backgroundcolor = buttoncolor, textcolor = Colors.white, digit}) {
      return Expanded(
          // flex: 0,
          child: Container(
        // width: double.infinity,
        margin: EdgeInsets.symmetric(
            horizontal: Dimension.height10, vertical: Dimension.height30 / 1.7),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 5,
              padding: EdgeInsets.all(Dimension.height20 * 1.2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimension.height10)),
              backgroundColor: backgroundcolor),
          onPressed: () => onButtonclick(digit),
          child: Text(
            digit,
            style: TextStyle(
                fontSize: Dimension.font20,
                color: textcolor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ));
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  // height: Dimension.height20,
                  // height: 200,x
                  width: double.maxFinite,
                  padding: EdgeInsets.all(Dimension.height10),
                  color: Colors.black54,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
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
                )),
            Expanded(
              flex: 4,
              child: Container(
                decoration:  BoxDecoration(
                  
                    border: Border.symmetric(
                      
                        horizontal: BorderSide(color: Colors.white.withOpacity(0.7), width: 1, style: BorderStyle.solid),
                        
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
                ),
              ),
            ),
          ],
        ));
  }
}

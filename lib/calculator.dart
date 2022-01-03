import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator_ extends StatefulWidget {
  const Calculator_({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator_> {
  String equation = "0";
  String result = "0";
  String expression = "0";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPress(String buttonText) {
    setState(() {
      if(buttonText == "C") {
        equation = "0";
        result = "0";
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;
      }
      else if(buttonText=="<-") {
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;
        if(equation.isNotEmpty && equation != "0" )  {
          equation = equation.substring(0, equation.length - 1);
        }
        else {
          equation = "0";
        }

      }
      else if(buttonText=="=") {
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;
        expression = equation;
        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch (e) {
          result = 'Errol';
        }
      }
      else{
        if(equation == "0") {
          equation = buttonText;
        }
        else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
            color: Colors.white,
              width: 1,
              style: BorderStyle.solid,
        )
        ),
        padding: EdgeInsets.all(8.0),
        onPressed: () => buttonPress(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator"),),
      body: Column(
        children: <Widget>[
          Container(
            margin:const EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: double.infinity,
            height: 80,
            alignment: Alignment.centerRight,
            padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration:const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Text(equation,style: TextStyle(fontSize: equationFontSize),),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding:const EdgeInsets.fromLTRB(10, 30, 10, 0),
            decoration:const BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Text(result,style: TextStyle(fontSize: resultFontSize),),
          ),

        const Expanded(
            child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              Container(
                width: MediaQuery.of(context).size.height * .45,
                child: Table(
                  children:  [
                    TableRow(
                      children: <Widget>[
                        buildButton("C", 1, Colors.blueAccent),
                        buildButton("<-", 1, Colors.greenAccent),
                        buildButton("M+", 1, Colors.redAccent),
                      ]
                    ),

                    TableRow(
                        children: <Widget>[
                          buildButton("7", 1, Colors.black),
                          buildButton("8", 1, Colors.black),
                          buildButton("9", 1, Colors.black),
                        ]
                    ),

                    TableRow(
                        children: <Widget>[
                          buildButton("4", 1, Colors.black),
                          buildButton("5", 1, Colors.black),
                          buildButton("6", 1, Colors.black),
                        ]
                    ),

                    TableRow(
                        children: <Widget>[
                          buildButton("1", 1, Colors.black),
                          buildButton("2", 1, Colors.black),
                          buildButton("3", 1, Colors.black),
                        ]
                    ),

                    TableRow(
                        children: <Widget>[
                          buildButton(".", 1, Colors.black),
                          buildButton("0", 1, Colors.black),
                          buildButton("00", 1, Colors.black),
                        ]
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("*", 1, Colors.blue)
                      ]
                    ),

                    TableRow(
                        children: [
                          buildButton("-", 1, Colors.blue)
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("+", 1, Colors.blue)
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("/", 1, Colors.blue)
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("=", 1, Colors.blue)
                        ]
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

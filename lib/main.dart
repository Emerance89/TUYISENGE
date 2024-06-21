import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorHome(title: 'CALCULATOR'),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key, required this.title});

  final String title;

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String displayValue = '0';
  String resultValue = '0';
  String operation = '';
  double num1 = 0;
  double num2 = 0;

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        displayValue = '0';
        resultValue = '0';
        num1 = 0;
        num2 = 0;
        operation = '';
      } else if (buttonText == 'B') {
        displayValue = displayValue.substring(0, displayValue.length - 1);
        if (displayValue.isEmpty) {
          displayValue = '0';
        }
      } else if (buttonText == '%' ||
          buttonText == '/' ||
          buttonText == 'x' ||
          buttonText == '-' ||
          buttonText == '+' ||
          buttonText == 'sin' ||
          buttonText == 'cos' ||
          buttonText == 'tan' ||
          buttonText == 'log') {
        num1 = double.parse(displayValue);
        operation = buttonText;
        displayValue = '0';
      } else if (buttonText == '=') {
        num2 = double.parse(displayValue);
        switch (operation) {
          case '+':
            resultValue = (num1 + num2).toString();
            break;
          case '-':
            resultValue = (num1 - num2).toString();
            break;
          case 'x':
            resultValue = (num1 * num2).toString();
            break;
          case '/':
            if (num2 != 0) {
              resultValue = (num1 / num2).toString();
            } else {
              resultValue = 'Error';
            }
            break;
          case '%':
            resultValue = (num1 % num2).toString();
            break;
          case 'sin':
            resultValue = sin(num1).toString();
            break;
          case 'cos':
            resultValue = cos(num1).toString();
            break;
          case 'tan':
            resultValue = tan(num1).toString();
            break;
          case 'log':
            resultValue = log(num1).toString();
            break;
          default:
            resultValue = displayValue;
            break;
        }
        displayValue = resultValue;
        num1 = 0;
        num2 = 0;
        operation = '';
      } else {
        if (displayValue == '0') {
          displayValue = buttonText;
        } else {
          displayValue += buttonText;
        }
      }
    });
  }

  Widget calcButton(String buttonText, Color textColor, Color buttonColor) {
    return Expanded(
      child: InkWell(
        onTap: () {
          buttonPressed(buttonText);
        },
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            buttonText,
            style: TextStyle(color: textColor, fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.normal),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.centerRight,
            height: 100,
            width: double.infinity,
            color: Colors.black,
            child: Text(
              displayValue,
              style: const TextStyle(color: Colors.white, fontSize: 60),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.centerRight,
            height: 120,
            width: double.infinity,
            color: Colors.black,
            child: Text(
              resultValue,
              style: const TextStyle(color: Colors.white, fontSize: 80),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calcButton('sin', Colors.white, Colors.green),
                        calcButton('cos', Colors.white, Colors.green),
                        calcButton('tan', Colors.white, Colors.green),
                        calcButton('log', Colors.white, Colors.green),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calcButton('7', Colors.white, Colors.pink),
                        calcButton('8', Colors.white, Colors.pink),
                        calcButton('9', Colors.white, Colors.pink),
                        calcButton('/', Colors.white, Colors.green),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calcButton('4', Colors.white, Colors.pink),
                        calcButton('5', Colors.white, Colors.pink),
                        calcButton('6', Colors.white, Colors.pink),
                        calcButton('x', Colors.white, Colors.green),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calcButton('1', Colors.white, Colors.pink),
                        calcButton('2', Colors.white, Colors.pink),
                        calcButton('3', Colors.white, Colors.pink),
                        calcButton('-', Colors.white, Colors.green),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calcButton('0', Colors.white, Colors.pink),
                        calcButton('.', Colors.white, Colors.pink),
                        calcButton('=', Colors.white, Colors.green),
                        calcButton('+', Colors.white, Colors.green),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calcButton('AC', Colors.white, Colors.green),
                        calcButton('B', Colors.white, Colors.green),
                        calcButton('%', Colors.white, Colors.green),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController inputController = TextEditingController();
  String result = " ";
  void convertToFahrenheit(){
       double celsius = double.parse(inputController.text) ?? 0.0;
    double fahrenheit = celsius*(9/5)+32;
    setState(() {
      result = "Fahrenheit : ${fahrenheit}";
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(title:Text("Celsius to Fahrenheit Conversion")),
        body :Column(
          children : [
          Container(
            child : TextField(
              controller : inputController,
              decoration : InputDecoration(
                border : OutlineInputBorder(),
              labelText : "Enter Celsius value"
            )
            )
          ),
            Container(
              margin : EdgeInsets.all(10),
            child : MaterialButton(
                shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: (){
                convertToFahrenheit();
            },
            child : Text("Convert")),
            ),
            Container(
              padding : EdgeInsets.all(10),
                margin : EdgeInsets.all(15),
                child : Text(result))
      ],
        )
      )
    );
  }
}

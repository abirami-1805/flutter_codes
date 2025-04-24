import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme : isDarkMode ? ThemeData.dark() : ThemeData.light(),
        home : Scaffold(
            appBar : AppBar(
                title : Text("Theme Toggle")
            ),
            body : Center(
                child : SwitchListTile(
                    title : Text("Switch Mode"),
                    value : isDarkMode,
                    onChanged : (value){
                      setState((){
                        isDarkMode = value;
                      });
                    }
                )
            )
        )
    );
  }
}

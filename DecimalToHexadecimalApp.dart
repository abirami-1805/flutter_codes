import 'package:flutter/material.dart';

void main() {
  runApp(DecimalToHexadecimalApp());
}

class DecimalToHexadecimalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Decimal to Hexadecimal Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DecimalToHexadecimalConverter(),
    );
  }
}

class DecimalToHexadecimalConverter extends StatefulWidget {
  @override
  _DecimalToHexadecimalConverterState createState() =>
      _DecimalToHexadecimalConverterState();
}

class _DecimalToHexadecimalConverterState
    extends State<DecimalToHexadecimalConverter> {
  final TextEditingController _decimalController = TextEditingController();
  String _hexadecimalResult = "";

  void _convertToHexadecimal() {
    setState(() {
      int? decimal = int.tryParse(_decimalController.text);
      if (decimal != null) {
        _hexadecimalResult = decimal.toRadixString(16).toUpperCase(); // Convert to hexadecimal
      } else {
        _hexadecimalResult = "Invalid Input";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decimal to Hexadecimal Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _decimalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Decimal Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertToHexadecimal,
              child: Text('Convert'),
            ),
            SizedBox(height: 16),
            Text(
              'Hexadecimal: $_hexadecimalResult',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

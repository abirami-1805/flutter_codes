import 'package:flutter/material.dart';

void main() {
  runApp(DecimalToBinaryApp());
}

class DecimalToBinaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Decimal to Binary Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DecimalToBinaryConverter(),
    );
  }
}

class DecimalToBinaryConverter extends StatefulWidget {
  @override
  _DecimalToBinaryConverterState createState() =>
      _DecimalToBinaryConverterState();
}

class _DecimalToBinaryConverterState extends State<DecimalToBinaryConverter> {
  final TextEditingController _decimalController = TextEditingController();
  String _binaryResult = "";

  void _convertToBinary() {
    setState(() {
      int? decimal = int.tryParse(_decimalController.text);
      if (decimal != null) {
        _binaryResult = decimal.toRadixString(2); // Convert to binary
      } else {
        _binaryResult = "Invalid Input";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decimal to Binary Converter'),
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
              onPressed: _convertToBinary,
              child: Text('Convert'),
            ),
            SizedBox(height: 16),
            Text(
              'Binary: $_binaryResult',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

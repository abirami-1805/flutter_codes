import 'package:flutter/material.dart';

void main() {
  runApp(DecimalToBinaryApp());
}

class DecimalToBinaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Decimal to Octal Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DecimalToOctalConverter(),
    );
  }
}

class DecimalToOctalConverter extends StatefulWidget {
  @override
  _DecimalToOctalConverterState createState() =>
      _DecimalToOctalConverterState();
}

class _DecimalToOctalConverterState extends State<DecimalToOctalConverter> {
  final TextEditingController _decimalController = TextEditingController();
  String _OctalResult = "";

  void _convertToOctal() {
    setState(() {
      int? decimal = int.tryParse(_decimalController.text);
      if (decimal != null) {
        _OctalResult = decimal.toRadixString(8); // Convert to Octal
      } else {
        _OctalResult = "Invalid Input";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decimal to Octal Converter'),
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
              onPressed: _convertToOctal,
              child: Text('Convert'),
            ),
            SizedBox(height: 16),
            Text(
              'Octal: $_OctalResult',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

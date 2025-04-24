import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyConverterApp());
}

class CurrencyConverterApp extends StatefulWidget {
  const CurrencyConverterApp({super.key});

  @override
  State<CurrencyConverterApp> createState() => _CurrencyConverterAppState();
}

class _CurrencyConverterAppState extends State<CurrencyConverterApp> {
  double inputAmount = 0.0, convertedAmount = 0.0;
  String fromCurrency = "USD", toCurrency = "INR";

  final Map<String, double> rates = {
    "USD": 1.0, "INR": 83.0, "EUR": 0.92, "GBP": 0.78, "JPY": 149.0,
  };

  void convert() {
    setState(() {
      convertedAmount = (inputAmount / rates[fromCurrency]!) * rates[toCurrency]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Currency Converter")),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Enter Amount"),
                onChanged: (value) => inputAmount = double.tryParse(value) ?? 0.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton(
                    value: fromCurrency,
                    items: rates.keys.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (newValue) => setState(() => fromCurrency = newValue!),
                  ),
                  Icon(Icons.arrow_forward),
                  DropdownButton(
                    value: toCurrency,
                    items: rates.keys.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (newValue) => setState(() => toCurrency = newValue!),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: convert, child: Text("Convert")),
              SizedBox(height: 20),
              Text("Converted: ${convertedAmount.toStringAsFixed(2)} $toCurrency",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

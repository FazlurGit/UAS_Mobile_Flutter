import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CurrencyConverterPage(),
  ));
}

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({Key? key}) : super(key: key);

  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  double inputValue = 0;
  String selectedCurrency = 'IDR'; // Mengubah mata uang awal menjadi IDR
  double convertedValue = 0;

  final currencies = ['USD', 'EUR', 'GBP', 'JPY', 'CNY', 'IDR'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                setState(() {
                  inputValue = double.tryParse(text) ?? 0;
                  convertedValue = convertCurrency(inputValue);
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter amount in $selectedCurrency',
              ),
              keyboardType: TextInputType.number,
            ),
            DropdownButton(
              value: selectedCurrency,
              items: currencies.map((currency) {
                return DropdownMenuItem(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (String? newCurrency) {
                setState(() {
                  selectedCurrency = newCurrency!;
                  convertedValue = convertCurrency(inputValue);
                });
              },
            ),
            Text(
              'Converted: $convertedValue $selectedCurrency',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  double convertCurrency(double inputValue) {
    // Conversion rates from IDR to other currencies
    const Map<String, double> conversionRates = {
      'USD': 0.000071, // Ubah nilai tukar IDR terhadap mata uang lain sesuai kebutuhan
      'EUR': 0.000060,
      'GBP': 0.000052,
      'JPY': 7.060000,
      'CNY': 0.402800,
      'IDR': 1,
    };

    final rate = conversionRates[selectedCurrency]!;
    final converted = inputValue * rate;
    return converted;
  }
}

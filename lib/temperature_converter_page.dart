import 'package:flutter/material.dart';

class TemperatureConverterPage extends StatefulWidget {
  const TemperatureConverterPage({Key? key}) : super(key: key);

  @override
  _TemperatureConverterPageState createState() => _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  double inputValue = 0;
  double convertedValue = 0;
  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konversi Suhu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  inputValue = double.tryParse(text) ?? 0;
                  convertedValue = convertTemperature(inputValue, fromUnit, toUnit);
                });
              },
              decoration: InputDecoration(
                labelText: 'Masukkan suhu dalam $fromUnit',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton(
                  value: fromUnit,
                  items: ['Celsius', 'Fahrenheit', 'Kelvin'].map((unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (String? selectedUnit) {
                    setState(() {
                      fromUnit = selectedUnit!;
                      convertedValue = convertTemperature(inputValue, fromUnit, toUnit);
                    });
                  },
                ),
                const Icon(Icons.arrow_forward),
                DropdownButton(
                  value: toUnit,
                  items: ['Celsius', 'Fahrenheit', 'Kelvin'].map((unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (String? selectedUnit) {
                    setState(() {
                      toUnit = selectedUnit!;
                      convertedValue = convertTemperature(inputValue, fromUnit, toUnit);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Hasil: $convertedValue $toUnit',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  double convertTemperature(double inputValue, String fromUnit, String toUnit) {
    if (fromUnit == 'Celsius' && toUnit == 'Fahrenheit') {
      return (inputValue * 9 / 5) + 32;
    } else if (fromUnit == 'Celsius' && toUnit == 'Kelvin') {
      return inputValue + 273.15;
    } else if (fromUnit == 'Fahrenheit' && toUnit == 'Celsius') {
      return (inputValue - 32) * 5 / 9;
    } else if (fromUnit == 'Fahrenheit' && toUnit == 'Kelvin') {
      return (inputValue - 32) * 5 / 9 + 273.15;
    } else if (fromUnit == 'Kelvin' && toUnit == 'Celsius') {
      return inputValue - 273.15;
    } else if (fromUnit == 'Kelvin' && toUnit == 'Fahrenheit') {
      return (inputValue - 273.15) * 9 / 5 + 32;
    } else {
      return inputValue; // Sama unit, tidak ada konversi yang diperlukan
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: TemperatureConverterPage(),
  ));
}

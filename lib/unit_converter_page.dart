import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: UnitConverterPage(),
  ));
}

class UnitConverterPage extends StatefulWidget {
  const UnitConverterPage({Key? key}) : super(key: key);

  @override
  _UnitConverterPageState createState() => _UnitConverterPageState();
}

class _UnitConverterPageState extends State<UnitConverterPage> {
  double inputValue = 0;
  double convertedValue = 0;
  String fromUnit = 'Kilogram';
  String toUnit = 'Pound';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
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
                  convertedValue = convertUnit(inputValue, fromUnit, toUnit);
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter value in $fromUnit',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton(
                  value: fromUnit,
                  items: ['Kilogram', 'Pound', 'Ounce'].map((unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (String? selectedUnit) {
                    setState(() {
                      fromUnit = selectedUnit!;
                      convertedValue = convertUnit(inputValue, fromUnit, toUnit);
                    });
                  },
                ),
                const Icon(Icons.arrow_forward),
                DropdownButton(
                  value: toUnit,
                  items: ['Kilogram', 'Pound', 'Ounce'].map((unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (String? selectedUnit) {
                    setState(() {
                      toUnit = selectedUnit!;
                      convertedValue = convertUnit(inputValue, fromUnit, toUnit);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Result: $convertedValue $toUnit',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  double convertUnit(double inputValue, String fromUnit, String toUnit) {
    // Definisi konversi satuan di sini
    if (fromUnit == 'Kilogram' && toUnit == 'Pound') {
      return inputValue * 2.20462;
    } else if (fromUnit == 'Kilogram' && toUnit == 'Ounce') {
      return inputValue * 35.274;
    } else if (fromUnit == 'Pound' && toUnit == 'Kilogram') {
      return inputValue * 0.453592;
    } else if (fromUnit == 'Pound' && toUnit == 'Ounce') {
      return inputValue * 16;
    } else if (fromUnit == 'Ounce' && toUnit == 'Kilogram') {
      return inputValue * 0.0283495;
    } else if (fromUnit == 'Ounce' && toUnit == 'Pound') {
      return inputValue * 0.0625;
    } else {
      return inputValue; // Sama unit, tidak ada konversi yang diperlukan
    }
  }
}

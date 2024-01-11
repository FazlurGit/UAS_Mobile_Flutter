import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double height = 160.0;
  double weight = 60.0;
  double bmi = 0.0;
  String bmiCategory = '';

  void calculateBMI() {
    setState(() {
      // Formula to calculate BMI: weight (kg) / (height (m) * height (m))
      double heightInMeters = height / 100;
      bmi = weight / (heightInMeters * heightInMeters);

      // Determine BMI category
      if (bmi < 18.5) {
        bmiCategory = 'Underweight';
      } else if (bmi < 24.9) {
        bmiCategory = 'Normal Weight';
      } else if (bmi < 29.9) {
        bmiCategory = 'Overweight';
      } else {
        bmiCategory = 'Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Height (cm): ${height.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 20),
            ),
            Slider(
              value: height,
              min: 100,
              max: 220,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
            ),
            Text(
              'Weight (kg): ${weight.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 20),
            ),
            Slider(
              value: weight,
              min: 30,
              max: 150,
              onChanged: (value) {
                setState(() {
                  weight = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 20),
            Text(
              'Your BMI: ${bmi.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Category: $bmiCategory',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

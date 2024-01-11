import 'package:flutter/material.dart';
import 'calculator_page.dart';
import 'currency_converter_page.dart';
import 'temperature_converter_page.dart';
import 'unit_converter_page.dart';
import 'bmi_calculator_page.dart';
import 'todo_list_page.dart';
import 'user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeLogoPage(),
    const UserPage(),
  ];

  Future<bool> _onWillPop(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MyApps'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                _onWillPop(context).then((value) {
                  if (value == true) {
                    Navigator.of(context).pop();
                  }
                });
              },
            ),
            // Tambahkan tombol Navigator Bar untuk User
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UserPage()));
              },
            ),
          ],
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeLogoPage extends StatelessWidget {
  const HomeLogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: <Widget>[
        _buildCard(
          'Kalkulator',
          Icons.calculate,
          () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CalculatorPage()));
          },
        ),
        _buildCard(
          'Konversi Mata Uang',
          Icons.attach_money,
          () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CurrencyConverterPage()));
          },
        ),
        _buildCard(
          'Konversi Suhu',
          Icons.ac_unit,
          () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TemperatureConverterPage()));
          },
        ),
        _buildCard(
          'Unit Converter',
          Icons.settings_ethernet,
          () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const UnitConverterPage()));
          },
        ),
        _buildCard(
          'BMI Calculator',
          Icons.accessibility_new,
          () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BMICalculatorApp()));
          },
        ),
        _buildCard(
          'To-Do List',
          Icons.list,
          () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ToDoApp()));
          },
        ),
      ],
    );
  }

  Widget _buildCard(String label, IconData icon, void Function() onPressed) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 40,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

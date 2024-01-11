import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'register_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final Map<String, String> registeredUsers = {};

  MyApp({Key? key}) : super(key: key); // Map untuk menyimpan data pengguna yang berhasil mendaftar

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/login': (context) => LoginPage(registeredUsers: registeredUsers),
        '/home': (context) => const HomePage(),
        '/register': (context) => RegisterPage(registeredUsers: registeredUsers), // Tambahkan rute ke halaman pendaftaran
        '/splash': (context) => SplashScreen(registeredUsers: registeredUsers), // Kirim registeredUsers ke SplashScreen
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  final Map<String, String> registeredUsers; // Terima registeredUsers sebagai argumen

  const SplashScreen({Key? key, required this.registeredUsers}) : super(key: key); // Tambahkan konstruktor

  @override
  _SplashScreenState createState() => _SplashScreenState(registeredUsers: registeredUsers);
}

class _SplashScreenState extends State<SplashScreen> {
  final Map<String, String> registeredUsers; // Terima registeredUsers sebagai argumen

  _SplashScreenState({required this.registeredUsers}); // Tambahkan konstruktor

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginPage(registeredUsers: registeredUsers), // Gunakan widget.registeredUsers
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 16),
            Text(
              'Welcome To MyApp',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  final Map<String, String> registeredUsers;
  const SplashScreen({Key? key, required this.registeredUsers}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState(registeredUsers: registeredUsers);
}

class _SplashScreenState extends State<SplashScreen> {
  final Map<String, String> registeredUsers;
  _SplashScreenState({required this.registeredUsers});

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginPage(registeredUsers: registeredUsers),
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

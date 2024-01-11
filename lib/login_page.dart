import 'package:flutter/material.dart';
import 'home_page.dart';
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
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(registeredUsers: registeredUsers),
        '/home': (context) => const HomePage(),
        '/register': (context) => RegisterPage(registeredUsers: registeredUsers), // Tambahkan rute ke halaman pendaftaran
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  final Map<String, String> registeredUsers; // Terima Map yang berisi data pengguna terdaftar

  const LoginPage({Key? key, required this.registeredUsers}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    final String username = usernameController.text;
    final String password = passwordController.text;

    // Periksa apakah pengguna terdaftar
    if (widget.registeredUsers.containsKey(username) && widget.registeredUsers[username] == password) {
      // Jika username dan password cocok, pindahkan ke HomePage
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));

      // Tampilkan pesan "Berhasil Login"
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Berhasil Login'),
            content: const Text('Selamat Datang Di Dalam MyApp!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Jika username atau password salah, tampilkan pesan kesalahan
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Tolong masukkan username dan password yang valid.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _goToRegister() {
    // Fungsi untuk menavigasi ke halaman pendaftaran
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16), // Menurunkan teks 'Silahkan Login'
              child: Text(
                'Silahkan Login', // Tambahkan teks ini di atas label "Username"
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16), // Tambahkan jarak antara teks dan input fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Turunkan interaksi sedikit
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Turunkan interaksi sedikit
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            TextButton( // Tambahkan tombol "Register"
              onPressed: _goToRegister,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

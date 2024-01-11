import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Map<String, String> registeredUsers; // Terima Map untuk menyimpan data pengguna

  const RegisterPage({Key? key, required this.registeredUsers}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _register() {
    final String username = usernameController.text;
    final String password = passwordController.text;

    // Tambahkan data pengguna ke Map
    widget.registeredUsers[username] = password;

    // Tampilkan pesan sukses pendaftaran
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pendaftaran Berhasil'),
          content: Text('Anda telah berhasil mendaftar dengan username: $username dan password: $password'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Text(
                'Silakan Daftar', // Teks sesuai pesan
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _register,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

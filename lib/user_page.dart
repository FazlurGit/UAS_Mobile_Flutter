import 'package:flutter/material.dart';
import 'login_page.dart'; // Import laman LoginPage

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  void _logout(BuildContext context) {
    // Navigasi langsung ke halaman login
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(registeredUsers: {},)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile_image.jpg'), // Ganti dengan path gambar profil
              ),
              const SizedBox(height: 16),
              const Text(
                'Fazlur',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Email Requeired',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi untuk mengedit profil atau keluar
                },
                child: const Text('Edit Profil'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Panggil fungsi _logout untuk kembali ke halaman login
                  _logout(context);
                },
                child: const Text('Keluar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

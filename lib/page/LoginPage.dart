import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warteg/service/api/ApiUser.dart';
import 'package:warteg/service/model/UserLoginResponse.dart';
import 'package:warteg/service/provider/UserLoginProvider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Apiuser _authService = Apiuser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }


  void _login() async {
    final response = await _authService.login(
      _emailController.text,
      _passwordController.text,
    );

    if (response['message'] == 'Login Berhasil') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login berhasil')));

      // Menyimpan token dan data pengguna menggunakan LoginProvider
      final loginProvider =
          Provider.of<UserLoginProvider>(context, listen: false);
      loginProvider.setToken(response['token']); // Menyimpan token

      // Menyimpan data pengguna dengan menggunakan model UserDataResponse
      final userData = DataUserLogin.fromJson(response['data']);
      loginProvider.setUserData(userData); // Menyimpan data pengguna

      // Navigasi ke halaman dashboard
      await Navigator.pushNamed(context, '/dashPengguna', arguments: userData);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login gagal')));
    }
  }
}

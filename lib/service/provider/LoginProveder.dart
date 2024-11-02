// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:warteg/service/model/GetPenggunaResponse.dart';
// import 'package:warteg/service/model/LoginResponse.dart';

// class Loginproveder with ChangeNotifier {
//   final _baseUrl = 'http://10.0.2.2/warteg/public/api';
//   String? _token;
//   LoginResponse? _userData;

//   String? get token => _token;
//   LoginResponse? get userData => _userData;

//   Future<bool> login(String username, String password) async {
//     final response = await http.post(
//       Uri.parse(
//           '$_baseUrl/pengguna/login'), // Ganti dengan URL API Anda
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({
//         'username': username,
//         'password': password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final loginResponse = loginResponseFromJson(response.body);
//       _token = loginResponse.token;
//       _userData = loginResponse.userData;
//       notifyListeners(); // Memberitahu listener bahwa data telah berubah
//       return true; // Login berhasil
//     } else {
//       return false; // Login gagal
//     }
//   }

//   Future<void> fetchUserData() async {
//     if (_token == null) return;

//     final response = await http.get(
//       Uri.parse(
//           '$_baseUrl/pengguna'), // Ganti dengan URL API Anda
//       headers: {
//         'Authorization': 'Bearer $_token', // Tambahkan token jika diperlukan
//       },
//     );

//     if (response.statusCode == 200) {
//       // Anda bisa memproses response di sini jika perlu
//       // Misalnya menyimpan data ke _userData
//     } else {
//       throw Exception('Gagal mengambil data pengguna');
//     }
//   }

//   void logout() {
//     _token = null;
//     _userData = null;
//     notifyListeners(); // Memberitahu listener bahwa data telah berubah
    
//   }
//   void setToken(String token) {
//     _token = token;
//     notifyListeners(); // Notifikasi bahwa data telah berubah
//   }

//   // Metode untuk menyimpan data pengguna
//   void setUserData(UserDataResponse data) {
//     _userData = data; // Simpan data pengguna
//     notifyListeners(); // Notifikasi bahwa data telah berubah
//   }

//   }



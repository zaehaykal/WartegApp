import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:warteg/service/model/UserLoginResponse.dart';

class UserLoginProvider with ChangeNotifier {
  final _baseUrl = 'http://10.0.2.2/warteg/public/api';
  String? _token;
  DataUserLogin? _userData;

  String? get token => _token;
  DataUserLogin? get userData => _userData;

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/pengguna/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final loginResponse = userResponseFromJson(response.body);
      _token = loginResponse.token;
      _userData = loginResponse.dataUserLogin;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<void> fetchUserData() async {
    if (_token == null) return;

    final response = await http.get(
      Uri.parse('$_baseUrl/auth/me'),
      headers: {
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      final loginResponse = userResponseFromJson(response.body);
      _userData = loginResponse.dataUserLogin;
      notifyListeners();
    } else {
      throw Exception('Failed to fetch user data');
    }
  }

  void logout() {
    _token = null;
    _userData = null;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void setUserData(DataUserLogin data) {
    _userData = data;
    notifyListeners();
  }
}

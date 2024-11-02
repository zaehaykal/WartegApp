import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:warteg/service/model/UserLoginResponse.dart';

class Apiuser {
  final _baseUrl = 'http://10.0.2.2/warteg/public/api';

  Future<DataUserLogin> getData() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/auth/'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return DataUserLogin.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load menu: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> register(String role, String name, String nomorhp, String foto, String email, String password, String alamat, String jenkel) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/register'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({
        'role': role,
        'name': name,
        'nomorhp': nomorhp,
        'foto': foto, // Pastikan untuk mengatur cara mengirimkan file jika diperlukan
        'email': email,
        'password': password,
        'alamat': alamat,
        'jenkel': jenkel,
      }),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to register: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> updateUser(String token, int userId, String name, String nomorhp, String email, String alamat, String jenkel) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/auth/update/$userId'), // Sesuaikan dengan rute update yang benar
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token', // Tambahkan token untuk otorisasi
      },
      body: json.encode({
        'name': name,
        'nomorhp': nomorhp,
        'email': email,
        'alamat': alamat,
        'jenkel': jenkel,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update user: ${response.statusCode}');
    }
  }

  Future<void> logout(String token) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/logout'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token', // Tambahkan token untuk otorisasi
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to logout: ${response.statusCode}');
    }
  }
}

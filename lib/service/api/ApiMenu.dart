import 'dart:convert';
import 'package:warteg/service/model/GetMenuResponse.dart';
import 'package:warteg/service/model/PostMenuResponese.dart';
import 'package:http/http.dart' as http;

class ApiMenu {
  String _baseUrl = 'http://10.0.2.2/warteg/public/api';

  Future<GetMenuResponse> getData() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/menu'),
        headers: headers,
      );

      // Memeriksa status kode dari respons
      if (response.statusCode == 200) {
        // Jika server mengembalikan respons OK (status code 200), parse JSON
        return GetMenuResponse.fromJson(json.decode(response.body));
      } else {
        // Jika server mengembalikan respons dengan error
        throw Exception('Failed to load menu: ${response.statusCode}');
      }
    } catch (e) {
      // Menangani error yang mungkin terjadi selama permintaan
      throw Exception('Failed to load menu: $e');
    }
  }

  Future<PostMenuResponse> sendData(String nama, String harga, String kategori, String foto) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    Map<String, String> body = {
      'nama': nama,
      'harga' : harga,
      'kategori' : kategori,
      'foto' : foto,
    };

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/menu'),
        headers: headers,
        body: body,
      );

      // Memeriksa status kode dari respons
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Jika server mengembalikan respons OK (status code 200), parse JSON
        return PostMenuResponse.fromJson(json.decode(response.body));
      } else {
        // Jika server mengembalikan respons dengan error
        throw Exception('Failed to load menu: ${response.statusCode}');
      }
    } catch (e) {
      // Menangani error yang mungkin terjadi selama permintaan
      throw Exception('Failed to load menu: $e');
    }
  }
}
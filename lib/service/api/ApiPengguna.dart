import 'package:http/http.dart' as http;
import 'package:warteg/service/model/GetPenggunaResponse.dart';
import 'dart:convert';

class ApiPengguna {
  final _baseUrl = 'http://10.0.2.2/warteg/public/api';
  String get urlImage => '$_baseUrl/images/';

  Future<GetPenggunaResponse> getData() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/pengguna'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return GetPenggunaResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load menu: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> deletePengguna(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/pengguna/$id'));

    if (response.statusCode == 200) {
      print('Hapus berhasil');
      return true; // Penghapusan berhasil
    } else {
      print('Failed to delete pengguna: ${response.body}');
      return false; // Penghapusan gagal
    }
  }
}

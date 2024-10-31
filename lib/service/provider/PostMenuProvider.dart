import 'package:flutter/material.dart';
import 'package:warteg/service/api/ApiMenu.dart';
import 'package:warteg/service/model/PostMenuResponese.dart';
import 'package:warteg/service/util/State.dart';

class Postmenuprovider extends ChangeNotifier {
  final ApiMenu api;

  Postmenuprovider({required this.api});

  late PostMenuResponse _getMenuResponse;
  late ResultState _state;
  late String _message;

  PostMenuResponse get getMenuResponse => _getMenuResponse;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> PostDataMenu(
      String nama, String harga, String kategori, String foto) async {
    _state = ResultState.loading;
    notifyListeners();

    try {
      final response = await api.sendData(nama, harga, kategori, foto);

      if (response.message == 'berhasil input data') {
        _state = ResultState.hasData;
        notifyListeners();

        return _getMenuResponse = response;
      } else {
        _state = ResultState.noData;
        notifyListeners();

        return _message = 'Tidak ada data';
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();

      throw _message = e.toString();
    }
  }
}

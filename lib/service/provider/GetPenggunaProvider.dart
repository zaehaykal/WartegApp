import 'package:flutter/material.dart';
import 'package:warteg/service/api/ApiPengguna.dart';
import 'package:warteg/service/model/GetPenggunaResponse.dart';
import 'package:warteg/service/util/State.dart';

class GetPenggunaProvider extends ChangeNotifier {
  final ApiPengguna api;
  GetPenggunaProvider({required this.api}) {
    GetDataPengguna();
  }
  late GetPenggunaResponse _getPenggunaResponse;
  late ResultState _state;
  late String _message;

  GetPenggunaResponse get getPenggunaResponse => _getPenggunaResponse;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> GetDataPengguna() async {
    _state = ResultState.loading;
    notifyListeners();

    try {
      final response = await api.getData();
      
      if (response.data.isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();

        return _getPenggunaResponse = response;
      } else {
        _state = ResultState.noData;
        notifyListeners();

        return _message = 'Tidak ada data';
      }
    } catch (e) {
      _state = ResultState.error;
      throw _message = e.toString();
    }
  }
}

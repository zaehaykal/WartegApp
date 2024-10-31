import 'package:flutter/material.dart';
import 'package:warteg/service/api/ApiMenu.dart';
import 'package:warteg/service/model/GetMenuResponse.dart';
import 'package:warteg/service/util/State.dart';

class GetMenuProvider extends ChangeNotifier{
  final ApiMenu api;

  GetMenuProvider({required this.api}){
    GetDataMenu();
  }


  late GetMenuResponse _getMenuResponse;
  late ResultState _state;
  late String _message;

  GetMenuResponse get getMenuResponse => _getMenuResponse;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> GetDataMenu() async {
    _state = ResultState.loading;
    notifyListeners();

    try{
      final response = await api.getData();

    if(response.data.isNotEmpty){
      _state = ResultState.hasData;
      notifyListeners();

      return _getMenuResponse = response;
    }else{
      _state = ResultState.noData;
      notifyListeners();

      return _message = 'Tidak ada data';
    }
    }catch(e){
      _state = ResultState.error;
      notifyListeners();

      throw _message = e.toString();
    }
    
  } 

}
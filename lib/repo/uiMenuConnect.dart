import 'dart:convert';

import 'package:exf/repo/Connect.dart';
import 'package:http/http.dart' as http;

class MenuModel{
  final String name;
  final String path;
  final List deps;
  const MenuModel({
    required this.name,
    required this.path,
    required this.deps
  });
  factory MenuModel.init({required Map<String, dynamic> json}) => new MenuModel(
    name: json["name"].toString(),
    path: json["path"].toString(),
    deps: new List.from(json["deps"])
  );
}

class UiConnect{

  Future<List<MenuModel?>> menuInit() async{
    final String _endPoint = "http://192.168.0.3:8000/flutter/ui/menu/all";
    final Uri _uri =  Uri.parse(_endPoint);
    return await Connect.httpGet<List<MenuModel?>>(uri: _uri, cb: (http.Response? _res) async{
      if(_res == null) return [];
      final Map<String, dynamic> _data = json.decode(_res.body);
      final List _menuData = _data['menu'];
      final List<MenuModel> _re = _menuData.map<MenuModel>((dynamic e) => this._init(e)).toList();
      return _re;
    });
  }

  MenuModel _init(Map<String, dynamic> json){
    List deps = List.from(json['deps']);
    if(deps.isEmpty){
      return new MenuModel.init(json: json);
    }
    else{
      json["deps"] = deps.map<MenuModel>((j) => this._init(j)).toList();
      return new MenuModel.init(json: json);
    }
  }

}
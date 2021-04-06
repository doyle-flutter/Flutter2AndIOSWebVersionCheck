import 'package:exf/repo/uiMenuConnect.dart';
import 'package:flutter/foundation.dart';

class UiDataProvider with ChangeNotifier{

  List<MenuModel?> _menu = [];
  List<MenuModel?> get menu => this._menu;

  UiDataProvider(){
    Future(this.menuLoad);
  }

  Future<void> menuLoad() async{
    final UiConnect uiConnect = new UiConnect();
    this._menu = await uiConnect.menuInit();
    return notifyListeners();
  }

  bool _exPannel = false;
  bool get exPannel => _exPannel;
  set exPannel(bool check){
    _exPannel = check;
    notifyListeners();
  }
}
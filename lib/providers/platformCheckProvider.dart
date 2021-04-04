import 'package:exf/repo/platformCheck.dart';
import 'package:flutter/foundation.dart';

class PlatformCheckProvider with ChangeNotifier{
  PlatformVersionCheck? _check;
  PlatformVersionCheck? get check => _check;
  Future<void> _init() async{
    final PlatformCheck _platformcheck = new PlatformCheck();
    this._check = await _platformcheck.check();
    notifyListeners();
    return;
  }
  PlatformCheckProvider(){
    Future<void>.microtask(() => _init());
  }
}
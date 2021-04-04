import 'dart:convert';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;

enum PlatformVersionCheck{
  ERROR,
  OK,
  NOT
}

class PlatformCheck{

  Future<String> getVersion() async => await PackageInfo.fromPlatform().then<String>((PackageInfo info) => info.version);

  Future<String> getServiceVersion() async{
    try{
      return await http.get(Uri.parse("http://192.168.0.3:8000/flutter/version")).then<String>(( http.Response res){
        if(res.statusCode != 200) return "";
        final Map<String, dynamic> _serviceVersion = json.decode(res.body);
        return _serviceVersion['version'].toString();
      });
    }
    catch(e){
      return "";
    }
  }

  Future<PlatformVersionCheck> check() async{
    final String _serviceVersion = await this.getServiceVersion();
    final String _appVersion = await this.getVersion().catchError((obj) => "", test: (obj) => false).timeout(Duration(seconds: 8),onTimeout: () async => "");
    if(_serviceVersion.isEmpty) return PlatformVersionCheck.ERROR;
    if(_appVersion != _serviceVersion) return PlatformVersionCheck.NOT;
    return PlatformVersionCheck.OK;
  }

}
import 'package:http/http.dart' as http;

class Connect{

  static Future<T> httpGet<T>({required Uri uri, Map<String, String>? headers, required Future<T> Function(http.Response? res) cb}) async{
    http.Response? _res;
    try{
      _res = await http.get(uri, headers: headers)
        .timeout(Duration(seconds: 8), onTimeout: () async => new http.Response("{}", 404));
      return cb(_res);
    }
    catch(e){

    }
    return cb(_res);
  }

}
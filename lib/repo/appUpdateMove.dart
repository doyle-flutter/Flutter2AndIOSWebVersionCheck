import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class AppUpDateMove{

  final String _andScheme = "https://play.google.com/store/apps/details?id=com.kakao.talk&hl=ko";
  final String _iosScheme = (() => Uri(
      scheme: 'itms-apps',
      path: 'itunes.apple.com/kr/app/apple-store/id362057947',
    ).toString())();
  Future<void> move() async{
    Platform.isAndroid
      ? await launch(this._andScheme)
      : await launch(this._iosScheme);
    return;
  }
}
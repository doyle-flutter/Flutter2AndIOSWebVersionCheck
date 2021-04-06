import 'package:exf/app.dart';
import 'package:exf/pages/and/mainANDPage.dart';
import 'package:exf/pages/ios/mainIOSPage.dart';
import 'package:exf/pages/web/mainWEBPage.dart';
import 'package:exf/providers/platformCheckProvider.dart';
import 'package:exf/providers/uiDataProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<PlatformCheckProvider>(create: (BuildContext context) => new PlatformCheckProvider()),
      ChangeNotifierProvider<UiDataProvider>(create: (BuildContext context) => new UiDataProvider())
    ],
    child: App(
      and: (BuildContext context) => MaterialApp(home: MainANDPage()),
      ios: (BuildContext context) => CupertinoApp(home: MainIOSPage()),
      web: (BuildContext context) => MaterialApp(home: MainWEBPage()),
    ),
  )
);







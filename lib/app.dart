import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class App extends StatelessWidget {
  final Widget Function(BuildContext context) web;
  final Widget Function(BuildContext context) ios;
  final Widget Function(BuildContext context) and;
  Widget Function(BuildContext context)? err;
  App({
    required this.web,
    required this.ios,
    required this.and,
    this.err
  });

  @override
  Widget build(BuildContext context) {
    if(!kIsWeb){
      try{
        return Platform.isIOS
            ? this.ios(context)
            : this.and(context);
      }
      catch(e){
        this.err ??= (BuildContext context) => MaterialApp(home: Scaffold(appBar: AppBar(title: Text("isERR"),),));
        return this.err!(context);
      }
    }
    else{
      return this.web(context);
    }
  }
}
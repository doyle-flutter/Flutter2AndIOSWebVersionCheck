import 'package:exf/providers/platformCheckProvider.dart';
import 'package:exf/repo/appUpdateMove.dart';
import 'package:exf/repo/platformCheck.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainANDPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlatformCheckProvider _provider = Provider.of<PlatformCheckProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("버전 체크"),),
      body: ((){
        if(_provider.check == null) return Container(child: Text("Load...."),);
        if(_provider.check == PlatformVersionCheck.ERROR) return Container(
          child: Center(child: Text("ERROR!")),
        );
        if(_provider.check == PlatformVersionCheck.NOT) return Container(
          child: Center(
            child: TextButton(
              child: Text("업데이트 이동"),
              onPressed: () async => await new AppUpDateMove().move(),
            ),
          ),
        );
        return Container(child: Text("Service ing ~"),);
      })()
    );
  }
}

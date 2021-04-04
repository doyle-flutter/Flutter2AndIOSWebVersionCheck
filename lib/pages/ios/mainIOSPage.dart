import 'package:exf/providers/platformCheckProvider.dart';
import 'package:exf/repo/appUpdateMove.dart';
import 'package:exf/repo/platformCheck.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MainIOSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlatformCheckProvider _provider = Provider.of<PlatformCheckProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("앱 버전 체크"),
      ),
      child: ((){
        if(_provider.check == null) return Container(child: Text("Load...."),);
        if(_provider.check == PlatformVersionCheck.ERROR) return Container(
          child: Center(child: Text("ERROR!",style: TextStyle(color: CupertinoColors.destructiveRed),)),
        );
        if(_provider.check == PlatformVersionCheck.NOT) return Container(
          child: Center(
            child: CupertinoButton(
              child: Text("이동"),
              onPressed: () async => await new AppUpDateMove().move(),
            ),
          ),
        );
        return Container(child: Text("Service ing ~"),);
      })()
    );
  }
}

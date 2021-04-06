// 마우스 또는 스크롤 이벤트 체크

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MainWEBPage extends StatefulWidget {
  @override
  _MainWEBPageState createState() => _MainWEBPageState();
}

class _MainWEBPageState extends State<MainWEBPage> {
  ScrollController _sc = new ScrollController();

  @override
  void initState() {
    _sc.addListener(() {
      // 스크롤 이동에 대한 - ListView || GridView || SingleChildScrollView 등에서 사용 가능
      print("userScrollDirection : ${_sc.position.userScrollDirection}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WEB"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: (){},
          )
        ],
      ),
      body: MouseRegion(
        // 마우스 '위 || 아래' 이동에 대한 체크
        onHover: (PointerHoverEvent hoverEvent) => print("hoverEvent : ${hoverEvent.delta.direction.isNegative ? "위로" : "아래"}"),
        // 마우스가 벗어났는지 체크
        onExit: (PointerExitEvent exitEvent) => print("exitEvent : $exitEvent"),
        child: ListView.builder(
          controller: _sc,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text("title $index"),
            onTap: () => print("index : $index"),
          )
        ),
      ),
    );
  }
}

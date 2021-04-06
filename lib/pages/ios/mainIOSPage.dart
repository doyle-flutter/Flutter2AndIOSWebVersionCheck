import 'package:exf/providers/platformCheckProvider.dart';
import 'package:exf/providers/uiDataProvider.dart';
import 'package:exf/repo/appUpdateMove.dart';
import 'package:exf/repo/platformCheck.dart';
import 'package:exf/repo/uiMenuConnect.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MainIOSPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    PlatformCheckProvider _provider = Provider.of<PlatformCheckProvider>(context);
    UiDataProvider _uiProvider = Provider.of<UiDataProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // middle: Text("앱 버전 체크"),
        middle: Text("Menu"),
      ),
      child: ((){
        // if(_provider.check == null) return Container(child: Text("Load...."),);
        // if(_provider.check == PlatformVersionCheck.ERROR) return Container(
        //   child: Center(child: Text("ERROR!",style: TextStyle(color: CupertinoColors.destructiveRed),)),
        // );
        // if(_provider.check == PlatformVersionCheck.NOT) return Container(
        //   child: Center(
        //     child: CupertinoButton(
        //       child: Text("이동"),
        //       onPressed: () async => await new AppUpDateMove().move(),
        //     ),
        //   ),
        // );
        return SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  AnimatedContainer(
                    alignment: Alignment.center,
                    color: CupertinoColors.systemGrey2,
                    height: _uiProvider.exPannel ? MediaQuery.of(context).size.height*0.4 : 60.0,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeOutBack,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _uiProvider.menu.isEmpty
                            ? <Widget>[Container(child: Text("Load..."),)]
                            : _uiProvider.menu.map<Widget>(
                            (MenuModel? model) => MenuWidget(model!,_uiProvider)
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2017/04/21/15/43/willow-catkin-2249018__480.png"
                        )
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      })()
    );
  }
}


class MenuWidget extends StatelessWidget {
  final MenuModel listModel;
  final UiDataProvider uiDataProvider;
  MenuWidget(this.listModel, this.uiDataProvider);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (listModel.deps.isNotEmpty) {
          uiDataProvider.exPannel = !uiDataProvider.exPannel;
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.3,
        decoration: BoxDecoration(
          color: CupertinoColors.white,
        ),
        margin: EdgeInsets.all(10.0),
        child: ((){
          if(this.uiDataProvider.exPannel && this.listModel.deps.isNotEmpty){
            return GridView.builder(
              itemCount: this.listModel.deps.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10.0
              ),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: (){
                  this.uiDataProvider.exPannel = !this.uiDataProvider.exPannel;
                },
                child: Container(
                  color: CupertinoColors.activeGreen.highContrastColor,
                  child: Center(
                    child: Text(
                      this.listModel.deps[index].name,
                      style: TextStyle(
                        color: CupertinoColors.white
                      ),
                    )
                  ),
                ),
              )
            );
          }
          return Center(
            child: Text(listModel.name),
          );
        })()
      ),
    );
  }
}


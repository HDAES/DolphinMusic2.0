import 'dart:ui';

import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/model/model.dart';
import 'package:flutter/material.dart';
class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> with SingleTickerProviderStateMixin{
   TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
              collapsedHeight: 150,
              expandedHeight: 350,
              tabbar:TabBar(
                labelColor: Colors.black,
                controller: this.tabController,
                tabs: <Widget>[
                  Tab(text: '我的'),
                  Tab(text: '动态'),
                ],
              ),
              paddingTop: MediaQuery.of(context).padding.top,
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                _mine(),
                _event(context)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final Widget tabbar;
  String statusBarMode = 'dark';

  SliverCustomHeaderDelegate({
    this.collapsedHeight,
    this.expandedHeight,
    this.paddingTop,
    this.tabbar
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  // void updateStatusBarBrightness(shrinkOffset) {
  //   if(shrinkOffset > 50 && this.statusBarMode == 'dark') {
  //     this.statusBarMode = 'light';
  //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       statusBarBrightness: Brightness.light,
  //       statusBarIconBrightness: Brightness.light,
  //     ));
  //   } else if(shrinkOffset <= 50 && this.statusBarMode == 'light') {
  //     this.statusBarMode = 'dark';
  //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       statusBarBrightness: Brightness.dark,
  //       statusBarIconBrightness: Brightness.dark,
  //     ));
  //   }
  // }

  // Color makeStickyHeaderBgColor(shrinkOffset) {
  //   final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
  //   return Color.fromARGB(alpha, 255, 255, 255);
  // }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if(shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 255, 255, 255);
    }
  }

  double setOpacity(shrinkOffset){
    if(shrinkOffset <= 50) {
      return 0.3;
    } else if(shrinkOffset<140&&shrinkOffset >= 50) {
      //print(shrinkOffset);
      return shrinkOffset/234;
    }else if(shrinkOffset>=140){
      return 0.6;
    }
    return 0;
  }

  double setInfoOpacity(shrinkOffset){
    if(shrinkOffset <= 70) {
      return 1.0;
    } else if( shrinkOffset<140 && shrinkOffset >= 70){
      return 50/shrinkOffset;
    }else if(shrinkOffset >=140){
      return 0.0;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // this.updateStatusBarBrightness(shrinkOffset);
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(Global.profile.profile.backgroundUrl,fit: BoxFit.cover),
          BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              color: Colors.black.withOpacity(setOpacity(shrinkOffset)),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color:Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        Global.profile.profile.nickname,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: this.makeStickyHeaderTextColor(shrinkOffset, false),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color:Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            child: Padding(
              padding: EdgeInsets.only(left:20,bottom: 20),
              child: Opacity(
                opacity: setInfoOpacity(shrinkOffset),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipOval(
                    child: Image.network(Global.profile.profile.avatarUrl,width: 60),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:15,bottom:5),
                    child: Text(Global.profile.profile.nickname,
                      style: TextStyle(fontSize: duSetFontSize(42),color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('关注 ${Global.profile.profile.follows}',style: TextStyle(color: Colors.white)),
                        Container(
                          width: 1,
                          height: 10,
                          margin: EdgeInsets.only(left:10,right:10),
                          color: Colors.white,
                        ),
                        Text('粉丝 ${Global.profile.profile.followeds}',style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:5),
                    child: Text('个性签名：${Global.profile.profile.signature}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              )
            )
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: tabbar,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight:Radius.circular(20),
                  topLeft:Radius.circular(20)
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}


//我的
Widget _mine(){
  return Column(
    children: <Widget>[
      Text('13')
    ],
  );
}

Widget _event(context){
  return FutureBuilder(
    future: getData(context),
     builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          print(snapshot.data.toJson()['events']);
          List data = snapshot.data.toJson()['events'];
          return Container(
            child: Column(
              children: data.map((item){
                return Text('123');
              }).toList(),
            ),
          );
        }else{
          return Text('loading');
        }
     }
  );

  
  
}

Future<UserEventModel> getData(context) async{
  return  MeApi.getUserEvent(context: context);
}
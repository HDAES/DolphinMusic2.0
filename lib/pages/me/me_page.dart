import 'dart:convert';
import 'dart:ui';

import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/common/values/values.dart';
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/model/model.dart';
import 'package:dolphinmusic/provider/provider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
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
          SliverFixedExtentList(
            itemExtent: 800,
            //加载内容
            delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return TabBarView(
                    controller: this.tabController,
                    children: <Widget>[
                      _mine(context),
                      _event(context)
                    ],
                  );
                },
              //设置显示个数
              childCount: 1,
            ),
          ),
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
Widget _mine(context){
  return Consumer<PlayListProvider>(
    builder:  (context, playlist, child){
      print(playlist.playlist);
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            ExpandableNotifier(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    ExpandablePanel(
                      header: Padding(
                        padding: EdgeInsets.only(top:10,bottom: 10),
                        child: Text(
                          "创建的歌单",
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: duSetFontSize(30)),
                        )
                      ),
                      collapsed: _createList(playlist.playlist),
                    )
                  ],
                ),
              ),
            ),
            ExpandableNotifier(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    ExpandablePanel(
                      header: Padding(
                        padding: EdgeInsets.only(top:10,bottom: 10),
                        child: Text(
                          "收藏的歌单",
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: duSetFontSize(30)),
                        )
                      ),
                      collapsed: _collectList(playlist.playlist),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      );
    },
  ); 
}





Widget _event(context){
  return FutureBuilder(
    future: getData(context),
     builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          List data = snapshot.data.toJson()['events'];
          return Container(
            color: Colors.white,
            child: Column(
              children: data.map((item){
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top:10,left:20),
                        child: Row( 
                          children: <Widget>[
                            ClipOval(
                              child: Image.network(item['user']['avatarUrl'],width: 40),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(item['user']['nickname'],style: TextStyle(color: Colors.blue)),
                                      Padding( padding:EdgeInsets.only(left:5),child: Text(filterType(item['type'])))
                                    ],
                                  ),
                                  Text(DateUtils.formateDate(item['eventTime']),style: TextStyle(fontSize: duSetFontSize(24),color:Colors.black54))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      filterWidget(item)
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1,color: AppColors.interval))
                  ),
                );
              }).toList(),
            ),
          );
        }else{
          return Text('loading');
        }
     }
  );

  
  
}

//类型筛选
String filterType(type){
  switch(type){
    case 13 :
      return "分享歌单";
    case 17 :
      return "分享电台节目";
    case 18 :
      return "分享单曲";
    case 19 :
      return "分享专辑";
    case 21 :
      return "分享视频";
    case 22 :
      return "转发";
    case 24  :
      return "分享专栏文章";
    case 28   :
      return "分享电台节目";
    case 39   :
      return "发布视频";
    case 41   :
      return "分享视频";
    default :
      return "分享";
  }
}

//内容显示
Widget filterWidget(item){
  Map jsons =json.decode(item['json']);
  if(item['type']== 41 || item['type'] == 21 ){
    return Padding(
      padding: EdgeInsets.only(left:70,top:20,bottom: 15 ),
      child: Stack(
        children: <Widget>[
          Container(
            width: 280,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(jsons['mv']['imgurl']),
                fit: BoxFit.fitWidth,
              )
            ),
          ),
          Positioned(
            top: 3,
            left: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right:5),
                      padding: EdgeInsets.only(left:3,right:3),
                      child: Text('mv',style: TextStyle(color: Colors.white)),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(2)
                      ),
                    ),
                    Text(jsons['mv']['name'],style: TextStyle(color: Colors.white))
                  ],
                ),
                Text(jsons['mv']['artist']['name'],style: TextStyle(color: Colors.white))
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 2,
            right: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.play_arrow,color: Colors.white),
                    Text(FormateUtils.formateCount(jsons['mv']['playCount']),style: TextStyle(color: Colors.white))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.equalizer,color: Colors.white,size: duSetFontSize(28),),
                    Text(FormateUtils.formateDuration(jsons['mv']['duration']),style: TextStyle(color: Colors.white))
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }else if(item['type']== 18){
    return Padding(
      padding: EdgeInsets.only(left:70,top:20,bottom: 15 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(jsons['song']['album']['picUrl']),
                fit: BoxFit.fitWidth,
              )
            ),
          ),
          Container(
            width: 250,
            padding: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(jsons['song']['album']['picUrl']),
                      fit: BoxFit.fitWidth,
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 180,
                        child: Text(
                          jsons['song']['name'],
                          style: TextStyle(fontSize: duSetFontSize(24)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1
                        ),
                      ),
                      Text(jsons['song']['artists'][0]['name'],style: TextStyle(fontSize: duSetFontSize(24)))
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: AppColors.interval,
              borderRadius: BorderRadius.circular(8)
            ),
          )
        ],
      )
    );
  }
  else{
    return Text('12');
  }
}

  Widget _createList(item){
    return Column(
      children: <Widget>[
        for(int i=0;i<item.playlist.length;i++)
        if(!item.playlist[i].ordered)
        _songItem(item.playlist[i]),
        _createSong()
      ],
    );
  }

  Widget _collectList(item){
    return Column(
      children: <Widget>[
        for(int i=0;i<item.playlist.length;i++)
        if(item.playlist[i].ordered)
        _songItem(item.playlist[i])
      ],
    );
  }

  Widget _songItem(item){
    return Padding(
      padding: EdgeInsets.only(bottom:5),
      child: Row(
        children: <Widget>[
          Image.network(item.coverImgUrl,width: 50),
          Padding(
            padding: EdgeInsets.only(left:10),
            child: GestureDetector(
              onTap: (){},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(item.name,style:TextStyle(fontSize: duSetFontSize(28),color: Colors.black87,fontWeight: FontWeight.bold)),
                  Text('${item.trackCount}首',style:TextStyle(fontSize: duSetFontSize(24),color: Colors.black38))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //创建歌单
  Widget _createSong(){
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  color: AppColors.interval,
                ),
                Positioned(
                  left: 10,
                  top:10,
                  child: Icon(Icons.add,color: Colors.black38,size: 30,),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left:10),
              child: Text('新建歌单'),
            )
          ],
        ),
      ),
    );
  }


//获取用户动态
Future<UserEventModel> getData(context) async{
  return  MeApi.getUserEvent(context: context);
}
import 'dart:ui';

import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/common/utils/screen.dart';
import 'package:dolphinmusic/common/widgets/music_item_widget.dart';
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/model/model.dart';
import 'package:flutter/material.dart';

class EveryDayRecommendPage extends StatefulWidget {
  @override
  _EveryDayRecommendPageState createState() => _EveryDayRecommendPageState();
}

class _EveryDayRecommendPageState extends State<EveryDayRecommendPage> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder(
        future: getData(context),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverCustomHeaderDelegate(
                    collapsedHeight: 110,
                    expandedHeight: 200,
                    image:snapshot.data['newalbums'].albums[0].blurPicUrl,
                    paddingTop: MediaQuery.of(context).padding.top,
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 50,
                  //加载内容
                  delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return MusicItemWidget(item:snapshot.data['everday'].recommend[index]);
                      },
                    //设置显示个数
                    childCount: snapshot.data['everday'].recommend.length,
                  ),
                ),
              ],
            );
          }else{
            return Text('loading');
          }
        }
      )
       
    );
  }
}
class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String image;
  String statusBarMode = 'dark';

  SliverCustomHeaderDelegate({
    this.collapsedHeight,
    this.expandedHeight,
    this.paddingTop,
    this.image
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }


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

  double setDayOpacity(shrinkOffset){
     if(shrinkOffset > 20) {
       return 0;
     }else{
       return 1;
     }
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
          Image.network(image,fit: BoxFit.cover),
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
                  height: 60,
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
                        '每日推荐',
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
            bottom: 55,
            left: 10,
            child: RichText(
              text: TextSpan(
                text: '${DateTime.now().day}',
                style: TextStyle(color: Colors.white.withOpacity(setDayOpacity(shrinkOffset)),fontSize: duSetFontSize(90),fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '/',
                    style: TextStyle(fontSize: duSetFontSize(36)),
                  ),
                  TextSpan(
                    text: '${DateTime.now().month<10?'0'+DateTime.now().month.toString():DateTime.now().month}',
                    style: TextStyle(fontSize: duSetFontSize(36)),
                  )
                ]
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(left:10,right:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.play_circle_outline,color: Colors.black,),
                      Padding(
                        padding: EdgeInsets.only(left:5),
                        child: Text('播放全部',style: TextStyle(fontWeight: FontWeight.bold))
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.list,color: Colors.black),
                      Padding(
                        padding: EdgeInsets.only(left:5),
                        child: Text('多选'),
                      )
                    ],
                  ),
                ],
              ),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight:Radius.circular(25),
                  topLeft:Radius.circular(25)
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}


Future getData(context) async{
  Map data = { 
    "everday":  await  DiscoveryApi.getEveryDay(context: context),
    "newalbums":await DiscoveryApi.getNewAlbums(context: context)
  };
  return data;
}
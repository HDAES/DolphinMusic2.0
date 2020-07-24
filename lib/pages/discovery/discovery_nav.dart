/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-07-23 22:30:13
 * @LastEditTime: 2020-07-23 23:15:37
 */ 
import 'package:dolphinmusic/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/values/values.dart';
import 'package:dolphinmusic/global.dart';



class DiscoveryNav extends StatefulWidget {
  @override
  _DiscoveryNavState createState() => _DiscoveryNavState();
}

class _DiscoveryNavState extends State<DiscoveryNav> {
  final List<Map> nav=[
    {"id":2,'icon':P.icon_playlist,'name':'歌单',"routepath":Routes.songList},
    {"id":3,'icon':P.icon_rank,'name':'排行榜',"routepath":Routes.rank},
    {"id":4,'icon':P.icon_radio,'name':'电台',"routepath":Routes.dj},
    {"id":5,'icon':P.icon_look,'name':'直播',"routepath":Routes.rank},
  ];

  DateTime dateTime= DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: (){ Routes.navigateTo(context, Routes.everyDayRec);},
            child: Container(
              margin: EdgeInsets.only(top:15),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom:5),
                        child: Image.asset(
                          P.icon_daily,
                          width: 50,
                          height: 50,
                        ),
                        decoration: BoxDecoration(
                          color:Global.appState.getThemeColor(),
                          borderRadius: BorderRadius.circular(25)
                        ),
                      ),
                      Text('每日推荐',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black87))
                    ],
                  ),
                  Positioned(
                    left:dateTime.day>10?20:24,
                    top: 19,
                    child: Text('${dateTime.day}',style: TextStyle(color: Global.appState.getThemeColor(),fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ),
          for(int i=0;i<nav.length;i++)
            GestureDetector(
            onTap: (){  Routes.navigateTo(context, nav[i]['routepath']);},
            child: Container(
              margin: EdgeInsets.only(top:15),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom:5),
                    child: Image.asset(
                      nav[i]['icon'],
                      width: 50,
                      height: 50,
                    ),
                    decoration: BoxDecoration(
                      color:Global.appState.getThemeColor(),
                      borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                  Text(nav[i]['name'],style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black87))
                ],
              ),
            )
          )
        ],
      )
    );
  }
}
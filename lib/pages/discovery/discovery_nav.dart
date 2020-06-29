import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/values/values.dart';
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class DiscoveryNav extends StatelessWidget {

  final List<Map> nav=[
    {"id":2,'icon':P.icon_playlist,'name':'歌单'},
    {"id":3,'icon':P.icon_rank,'name':'排行榜'},
    {"id":4,'icon':P.icon_radio,'name':'电台'},
    {"id":5,'icon':P.icon_look,'name':'直播'},
  ];

  DateTime dateTime= DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: (){},
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
                    left:dateTime.day>10?20:23,
                    top: 19,
                    child: Text('${dateTime.day}',style: TextStyle(color: Global.appState.getThemeColor(),fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          )
        ]+nav.map((item){
          return GestureDetector(
            onTap: (){ },
            child: Container(
              margin: EdgeInsets.only(top:15),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom:5),
                    child: Image.asset(
                      item['icon'],
                      width: 50,
                      height: 50,
                    ),
                    decoration: BoxDecoration(
                      color:Global.appState.getThemeColor(),
                      borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                  Text(item['name'],style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black87))
                ],
              ),
            )
          );
        }).toList(),
      )
    );
  }
}
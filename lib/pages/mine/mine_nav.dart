import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/common/values/values.dart';
class MineNav extends StatelessWidget {

  final List<Map> nav=[
    {"id":1,'icon':P.icon_music,'name':'本地音乐'},
    {"id":2,'icon':P.icon_late_play,'name':'最近播放'},
    {"id":3,'icon':P.icon_download_black,'name':'下载管理'},
    {"id":4,'icon':P.icon_broadcast,'name':'我的电台'},
    {"id":5,'icon':P.icon_collect,'name':'我的收藏'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: nav.map((item){
          return GestureDetector(
            onTap: (){},
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(item['icon'],width: duSetWidth(100)),
                Expanded(
                  child: Container(
                    height: duSetWidth(110),
                    margin: EdgeInsets.only(left:5),
                    alignment: Alignment.centerLeft,
                    child: Text(item['name'],style: TextStyle(fontSize: duSetFontSize(30))),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1,color:item['id']!=5?AppColors.underline:AppColors.primaryBackground)
                      )
                    ),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

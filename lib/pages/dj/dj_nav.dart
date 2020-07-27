import 'package:dolphinmusic/common/values/values.dart';
import 'package:dolphinmusic/routers/routes.dart';
import 'package:flutter/material.dart';

import '../../global.dart';

class DjNavWidget extends StatefulWidget {
  @override
  _DjNavWidgetState createState() => _DjNavWidgetState();
}

class _DjNavWidgetState extends State<DjNavWidget> {
   final List<Map> nav=[
    {"id":1,'icon':P.dj_sort,'name':'电台分类',"routerPath":Routes.djSort},
    {"id":2,'icon':P.dj_rank,'name':'电台排行',"routerPath":Routes.djSort},
    {"id":3,'icon':P.dj_menber,'name':'付费精品',"routerPath":Routes.djSort},
    {"id":4,'icon':P.dj_study,'name':'主播学院',"routerPath":Routes.djSort},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: nav.map((item){
        return GestureDetector(
            onTap: (){Routes.navigateTo(context, item['routerPath']);},
            child: Container(
              margin: EdgeInsets.only(top:15),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(bottom:5),
                    alignment: Alignment.center,
                    child: Container(
                      width: 30,
                      height: 30,
                      child: Image.asset(item['icon']),
                    ),
                    decoration: BoxDecoration(
                      color:Global.appState.getThemeColor(),
                      borderRadius: BorderRadius.circular(60)
                    ),
                  ),
                  Text(item['name'],style: TextStyle(color: Colors.black87))
                ],
              ),
            )
          );
      }).toList(),
    ),
  );
  }
}
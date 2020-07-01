import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/routers/routes.dart';

class DynamicHotWall extends StatefulWidget {
  @override
  _DynamicHotWallState createState() => _DynamicHotWallState();
}

class _DynamicHotWallState extends State<DynamicHotWall> {

  List<String> monthEnglish =  ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Spt","Oct","Nov","Dec"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Routes.navigateTo(context,'/hotwall');},
      child: Container(
        padding: EdgeInsets.only(top:15,left:15,right:20,bottom:15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('云村热评墙',style: TextStyle(fontSize: duSetFontSize(36),fontWeight: FontWeight.bold,color: Colors.white)),
                    Icon(Icons.chevron_right,color: Colors.white)
                  ],
                ),
                Text('${Global.profile.profile.nickname}，原来大家都在云村看这些评论！',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text('${monthEnglish[DateTime.now().month-1]}.',style: TextStyle(fontSize: duSetFontSize(30),fontWeight: FontWeight.bold,color: Colors.white)),
                Text('${DateTime.now().day<10?'0'+DateTime.now().day.toString():DateTime.now().day}',style: TextStyle(fontSize: duSetFontSize(40),fontWeight: FontWeight.bold,color: Colors.white))
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
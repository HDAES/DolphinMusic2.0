import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/common/values/values.dart';
import 'package:dolphinmusic/pages/dynamic/dynamic_hot_wall.dart';

class DynamicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left:10,right:10),
      children: <Widget>[
        DynamicHotWall()
      ],
    );
  }
  

 

}
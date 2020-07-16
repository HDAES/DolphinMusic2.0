import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/pages/dynamic/dynamic_hot_topic.dart';
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/common/values/values.dart';
import 'package:dolphinmusic/pages/dynamic/dynamic_hot_wall.dart';

class DynamicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backColor,
      child: ListView(
        padding: EdgeInsets.only(left:duSetWidth(20),right:duSetWidth(20)),
        children: <Widget>[
          DynamicHotWall(),
          DynamicHotTopic()
        ],
      ),
    );
  }
  

 

}
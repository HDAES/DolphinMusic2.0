import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/common/values/values.dart';
import 'package:dolphinmusic/pages/mine/mine_nav.dart';
import 'package:dolphinmusic/pages/mine/mine_create.dart';
class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MineNav(),
        Container(child: Text(''),height: duSetHeight(20),color: AppColors.interval),
        MineCreate()
      ],
    );
  }
}
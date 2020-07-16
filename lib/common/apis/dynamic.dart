import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/model/model.dart';
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/common/values/values.dart';

class DynamicApi{
  ///云村热评墙
  static Future<HotWallModel> getDynamic({@required BuildContext context}) async{
     var response = await HttpUtil().get(
      '/comment/hotwall/list',
      context: context,
    );
    return HotWallModel.fromJson(response);
  }

  ///热门话题
  static Future<HotTopicModel> getHotTopic({@required BuildContext context}) async{
     var response = await HttpUtil().get(
      '/hot/topic',
      context: context,
    );
    return HotTopicModel.fromJson(response);
  }
}
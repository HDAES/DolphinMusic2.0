import 'package:dolphinmusic/model/dj_perfered.dart';
import 'package:dolphinmusic/model/dj_pay_toplist.dart';
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/model/model.dart';


class DjApi{
  ///电台banner 
  static Future<DjBannerModel > getDjBanner({@required BuildContext context}) async{
     var response = await HttpUtil().get(
      '/dj/banner',
      context: context,
    );
    return DjBannerModel.fromJson(response);
  }
  ///电台分类
  static Future<DjSortModel> getDjSort({@required BuildContext context}) async{
     var response = await HttpUtil().get(
      '/dj/catelist',
      context: context,
    );
    return DjSortModel.fromJson(response);
  }
  ///电台 - 今日优选
  static Future<DjPerferedModel > getDjPerfered({@required BuildContext context}) async{
     var response = await HttpUtil().get(
      '/dj/today/perfered',
      context: context,
    );
    return DjPerferedModel.fromJson(response);
  }
  ///电台 - 付费精品
  static Future<DjPayToplistModel > getDjPayToplist({@required BuildContext context}) async{
     var response = await HttpUtil().get(
      '/dj/toplist/pay?limit=3',
      context: context,
    );
    return DjPayToplistModel.fromJson(response);
  }
}
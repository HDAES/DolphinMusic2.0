/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-06-29 20:44:27
 * @LastEditTime: 2020-06-29 22:46:52
 */ 
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/model/model.dart';
import 'package:dolphinmusic/common/values/values.dart';

class DiscoveryApi {
  ///获取首页banner
  static Future<BannerModel> getDiscoveryBanner({@required BuildContext context}) async{
     var response = await HttpUtil().get(
      '/banner?type=2',
      context: context,
    );
    return BannerModel.fromJson(response);
  }
  ///获取推荐歌单
  static Future<RecSongListModel> getRecSongList({@required BuildContext context}) async{
    var response = await HttpUtil().get(
      '/personalized?limit=8',
      context: context,
    );
    return RecSongListModel.fromJson(response);
  }
  ///推荐新音乐
  static Future<RecMusicListModel> getRecMusicList({@required BuildContext context}) async{
    var response = await HttpUtil().get(
      '/personalized/newsong',
      context: context,
    );
    return RecMusicListModel.fromJson(response);
  }
  ///推荐新碟
  static Future<RecaAbumsListModel> getRecaAbumsList({@required BuildContext context}) async{
    var response = await HttpUtil().get(
      '/album/newest',
      context: context,
    );
    return RecaAbumsListModel.fromJson(response);
  }
  ///推荐mv
  static Future<RecMvModel> getRecMvList({@required BuildContext context}) async{
    var response = await HttpUtil().get(
      '/personalized/mv',
      context: context,
    );
    return RecMvModel.fromJson(response);
  }

  /// 每日推荐
 static Future<EveryDayModel> getEveryDay({@required BuildContext context}) async{
    var response = await HttpUtil().get(
      '/recommend/songs',
      context: context,
    );
    return EveryDayModel.fromJson(response);
  }

  /// 推荐专辑
  static Future<NewAlbumsModel> getNewAlbums({@required BuildContext context}) async{
    var response = await HttpUtil().get(
      '/album/newest',
      context: context,
    );
    return NewAlbumsModel.fromJson(response);
  }
  
  ///排行榜
  static Future<TopListModel> getTopList({@required BuildContext context}) async{
    var response = await HttpUtil().get(
      '/toplist/detail',
      context: context,
    );
    return TopListModel.fromJson(response);
  }
}
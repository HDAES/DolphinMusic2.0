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
}
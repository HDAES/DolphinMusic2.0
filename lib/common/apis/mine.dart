import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/model/model.dart';
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/common/values/values.dart';

class MineApi{
  ///获取用户歌单
  static Future<MineSongListModel> getUserSongList({@required BuildContext context}) async{
     var response = await HttpUtil().get(
      '/user/playlist?uid=${Global.profile.account.id}',
      context: context,
    );
    return MineSongListModel.fromJson(response);
  }
}
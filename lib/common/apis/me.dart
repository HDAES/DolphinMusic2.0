import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/model/model.dart';
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/common/values/values.dart';

class MeApi{
  ///获取用户动态
  static Future<UserEventModel> getUserEvent({@required BuildContext context}) async{
     var response = await HttpUtil().get(
      '/user/event?uid=${Global.profile.account.id}',
      context: context,
    );
    return UserEventModel.fromJson(response);
  }
}



import 'package:dolphinmusic/common/widgets/widgets.dart';
import 'package:dolphinmusic/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/model/model.dart';
import 'package:dolphinmusic/common/values/values.dart';

/// 用户
class  UserApi {
  ///登录
  static Future<UserModel> login({
    @required BuildContext context,
    params,
  })async {
     var response = await HttpUtil().get(
      '/login/cellphone',
      context: context,
      params: params,
    );
    print(response);
    if(response['code']==200){
      Toast.show('登录成功');
      StorageUtil().setJSON(STORAGE_USER_PROFILE_KEY,response);
      Routes.navigateTo(context, Routes.index);
    }
    return UserModel.fromJson(response);
  }

  ///登录状态
  static loginStatus({ @required BuildContext context,}) async{
     var response = await HttpUtil().get('/login/status', context: context);
     print(response);
  }
}
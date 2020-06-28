import 'package:dolphinmusic/model/model.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/common/values/values.dart';
import 'package:dolphinmusic/provider/provider.dart';
import 'package:flutter/material.dart';
class Global {
    /// 用户配置
  static UserModel profile = UserModel(
    token: null,
  );

   /// 是否离线登录
  static bool isOfflineLogin = false;

  static ThemeState appState = ThemeState();
  /// init
  static Future init() async {
     // 运行初始
    WidgetsFlutterBinding.ensureInitialized();
    //工具初始
    await StorageUtil.init();
    //获取主题颜色
    appState.getLocalThemeColor(true);
    // 读取离线用户信息
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
      if (_profileJSON != null) {
        profile = UserModel.fromJson(_profileJSON);
        isOfflineLogin = true;
      }
    }
}
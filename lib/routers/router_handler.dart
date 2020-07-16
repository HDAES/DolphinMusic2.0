import 'package:dolphinmusic/pages/me/me_page.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:dolphinmusic/pages/hot_wall/hot_wall_page.dart';

//热评墙
Handler hotWallHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return HotWallPage();
  }
);
//我的中心
Handler meHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return MePage();
  }
);
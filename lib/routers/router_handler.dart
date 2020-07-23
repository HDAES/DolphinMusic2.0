import 'package:dolphinmusic/pages/discovery_page/every_day_recommend/index_page.dart';
import 'package:dolphinmusic/pages/index_page.dart';
import 'package:dolphinmusic/pages/me/me_page.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:dolphinmusic/pages/hot_wall/hot_wall_page.dart';


Handler indexHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return IndexPage();
  }
);

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

//每日推荐
Handler everyDayRecHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return EveryDayRecommendPage();
  }
);

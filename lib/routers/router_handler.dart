/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-07-23 22:30:13
 * @LastEditTime: 2020-07-23 23:07:29
 */ 
import 'package:dolphinmusic/pages/dj/dj_page.dart';
import 'package:dolphinmusic/pages/discovery_page/every_day/index_page.dart';
import 'package:dolphinmusic/pages/discovery_page/rank/rank.dart';
import 'package:dolphinmusic/pages/discovery_page/song_list/song_list_page.dart';
import 'package:dolphinmusic/pages/dj/dj_sort_page.dart';
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

//歌单广场
Handler songListHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return SongListPage();
  }
);
//排行榜
Handler rankHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return RankPage();
  }
);
//电台
Handler djHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return DjPage();
  }
);
//电台分类页面
Handler djSortHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return DjSortPage();
  }
);

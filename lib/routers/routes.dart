/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-07-23 22:30:13
 * @LastEditTime: 2020-07-23 23:08:14
 */ 
import 'package:dolphinmusic/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:dolphinmusic/routers/router_handler.dart';

class Routes {
  static Router router;
  static String index='/index';
  static String hotwall = '/hotwall';
  static String me = '/me';
  static String everyDayRec = '/everyDayRec';
  static String songList = '/songList';
  static String rank = '/rank';
  static String dj = '/dj';
  static String djSort = '/djSort';

  static void configRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
        return ;
      }
    );

    router.define(index, handler: indexHandler);   //首页
    router.define(hotwall, handler: hotWallHandler);   //首页
    router.define(me, handler: meHandler);   //首页
    router.define(everyDayRec, handler: everyDayRecHandler);   //每日推荐
    router.define(songList, handler: songListHandler);  //歌单广场
    router.define(rank, handler: rankHandler);  //排行榜
    router.define(dj, handler: djHandler);  //电台
    router.define(djSort, handler: djSortHandler);  //电台分类
  }

  

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params, TransitionType transition = TransitionType.native}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    if(query!='') print('我是navigateTo传递的参数：$query');
    

    path = path + query;
    return Application.router.navigateTo(context, path, transition:transition);
  }
}
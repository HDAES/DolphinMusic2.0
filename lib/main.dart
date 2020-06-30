import 'package:dolphinmusic/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/pages/index_page.dart';
import 'package:dolphinmusic/pages/login_page.dart';
void main()  async{
  await Global.init();
  runApp(MultiProvider(
      providers:[
         ChangeNotifierProvider(create: (context)=> Global.appState)
      ],
      child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: BotToastInit(),
      theme: ThemeData(
        primarySwatch:Global.appState.getThemeColor(),
        iconTheme: IconThemeData(color:Global.appState.getThemeColor())
      ),
      home: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: Global.isOfflineLogin?IndexPage():LoginPage(),
      )
    );
  }
}

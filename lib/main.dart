import 'package:dolphinmusic/common/values/values.dart';
import 'package:dolphinmusic/provider/playlist.dart';
import 'package:dolphinmusic/routers/application.dart';
import 'package:dolphinmusic/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/pages/index_page.dart';
import 'package:dolphinmusic/pages/login_page.dart';
import 'package:fluro/fluro.dart';
void main()  async{
  await Global.init();
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=> Global.appState),
        ChangeNotifierProvider(create:(context) =>PlayListProvider())
      ],
      child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     //MyNet.getLoginState();
    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Application.router.generator,
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

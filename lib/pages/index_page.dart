
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:dolphinmusic/provider/provider.dart';
import 'package:dolphinmusic/pages/discovery/discovery_page.dart';
import 'package:dolphinmusic/pages/mine/mine_page.dart';
import 'package:dolphinmusic/pages/dynamic/dynamic_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int currentIndex=0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 750, height: 1334);
    return SafeArea(
        child:Column(
          children: <Widget>[
            _header (),
            Expanded(
              child: IndexedStack(
                index: currentIndex,
                children: <Widget>[
                  DiscoveryPage(),
                  MinePage(),
                  DynamicPage()
                ],
              ),
            ) 
          ],
        )
      );
  }

  Widget _header (){
    TextStyle _normalStyle=TextStyle(fontSize: duSetFontSize(32),fontWeight: FontWeight.normal,color: Colors.black);
    TextStyle _selectStyle=TextStyle(fontSize: duSetFontSize(36),fontWeight: FontWeight.w600,color:Provider.of<ThemeState>(context, listen: false).getThemeColor());
    return Container(
      padding: EdgeInsets.only(left:duSetWidth(20),right: duSetWidth(20)),
      height: duSetHeight(100),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){Routes.navigateTo(context,Routes.me);},
            child: ClipOval(
              child: Image.network(Global.profile.profile.avatarUrl,width: 40),
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: (){this.setState(() {currentIndex=0;});},
                child: Text('发现',style:currentIndex==0?_selectStyle:_normalStyle),
              ),
              GestureDetector(
                onTap: (){this.setState(() {currentIndex=1;});},
                child: Padding(
                  padding: EdgeInsets.only(left:duSetWidth(60),right: duSetWidth(60)),
                  child: Text('我的',style:currentIndex==1?_selectStyle:_normalStyle),
                ),
              ),
              GestureDetector(
                onTap: (){this.setState(() {currentIndex=2;});},
                child: Text('动态',style:currentIndex==2?_selectStyle:_normalStyle),
              ),
            ],
          ),
          Icon(Icons.search)
        ],
      ),
    );
  } 
}
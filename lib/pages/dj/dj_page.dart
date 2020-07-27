import 'package:dolphinmusic/pages/dj/dj_banner.dart';
import 'package:flutter/material.dart';
import 'dj_nav.dart';
import 'dj_pay_toplist.dart';
import 'dj_perfered.dart';
import 'dj_sort.dart';

class DjPage extends StatefulWidget {
  @override
  _DjPageState createState() => _DjPageState();
}

class _DjPageState extends State<DjPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主播电台',style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){ Navigator.pop(context);},
          child: Icon(Icons.arrow_back_ios,color: Colors.black),
        ),
      ),
      body: ListView(
        children: <Widget>[
          DjBannerWidget(),
          DjNavWidget(),
          DjPerferedWidget(),
          DjPayTopListWidget(),
          DjSortWidget(),
          
        ],
      ),
    );
  }
  
}


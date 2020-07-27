import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/common/values/values.dart';
import 'package:dolphinmusic/provider/dj.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DjSortPage extends StatefulWidget {
  @override
  _DjSortPageState createState() => _DjSortPageState();
}

class _DjSortPageState extends State<DjSortPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电台分类',style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){ Navigator.pop(context);},
          child: Icon(Icons.arrow_back_ios,color: Colors.black),
        ),
      ),
      body:Consumer<DjProvider>(
        builder:  (context, data, child){
          return 
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(duSetWidth(40)),
                    child: Text('热门分类',style: TextStyle(fontSize: duSetFontSize(36))),
                ),
                Wrap(
                  children:[
                    for(int i=0;i<6;i++)
                      Container(
                        alignment: Alignment.centerLeft,
                        width:duSetWidth(375),
                        height: duSetWidth(100),
                        padding: EdgeInsets.only(left: duSetWidth(40)),
                        child: Row(
                          children: <Widget>[
                            Image.network(data.djSort.categories[i].pic96x96Url,color: Colors.black87,width:24),
                            Padding(
                              padding: EdgeInsets.only(left:5),
                              child: Text(data.djSort.categories[i].name,style: TextStyle(color: Colors.black87)),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            top:BorderSide(width: 1,color: AppColors.interval),
                            right: BorderSide(width: 1,color: AppColors.interval),
                            bottom:BorderSide(width:i==4||i==5?1:0,color: AppColors.interval),
                          )
                        ),
                      )
                  ]
                ),
                Padding(
                    padding: EdgeInsets.all(duSetWidth(40)),
                    child: Text('更多分类',style: TextStyle(fontSize: duSetFontSize(36))),
                ),
                Wrap(
                  children:[
                    for(int i=6;i<data.djSort.categories.length;i++)
                      Container(
                        alignment: Alignment.centerLeft,
                        width:duSetWidth(375),
                        height: duSetWidth(100),
                        padding: EdgeInsets.only(left: duSetWidth(40)),
                        child: Row(
                          children: <Widget>[
                            Image.network(data.djSort.categories[i].pic96x96Url,color: Colors.black87,width:24),
                            Padding(
                              padding: EdgeInsets.only(left:8),
                              child: Text(data.djSort.categories[i].name,style: TextStyle(color: Colors.black87)),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            top:BorderSide(width: 1,color: AppColors.interval),
                            right: BorderSide(width: 1,color: AppColors.interval),
                            bottom:BorderSide(width:i==data.djSort.categories.length-1||i==data.djSort.categories.length-2?1:0,color: AppColors.interval),
                          )
                        ),
                      )
                  ]
                ),
              ],
            ),
          );
        }
      )
    );
  }
}
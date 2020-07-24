import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/common/values/values.dart';
import 'package:flutter/material.dart';

class DjSortWidget extends StatefulWidget {
  @override
  _DjSortWidgetState createState() => _DjSortWidgetState();
}

class _DjSortWidgetState extends State<DjSortWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSort(context),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return Container(
          
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
                            Image.network(snapshot.data.categories[i].pic96x96Url,color: Colors.black87,width:24),
                            Padding(
                              padding: EdgeInsets.only(left:5),
                              child: Text(snapshot.data.categories[i].name,style: TextStyle(color: Colors.black87)),
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
                    for(int i=6;i<snapshot.data.categories.length;i++)
                      Container(
                        alignment: Alignment.centerLeft,
                        width:duSetWidth(375),
                        height: duSetWidth(100),
                        padding: EdgeInsets.only(left: duSetWidth(40)),
                        child: Row(
                          children: <Widget>[
                            Image.network(snapshot.data.categories[i].pic96x96Url,color: Colors.black87,width:24),
                            Padding(
                              padding: EdgeInsets.only(left:8),
                              child: Text(snapshot.data.categories[i].name,style: TextStyle(color: Colors.black87)),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            top:BorderSide(width: 1,color: AppColors.interval),
                            right: BorderSide(width: 1,color: AppColors.interval),
                            bottom:BorderSide(width:i==snapshot.data.categories.length-1||i==snapshot.data.categories.length-2?1:0,color: AppColors.interval),
                          )
                        ),
                      )
                  ]
                ),
              ],
            ),
          );
        }else{
          return Text('loading');
        }
      }
    );
  }

  Future getSort(context) async{
    return  DjApi.getDjSort(context: context);
  }
}
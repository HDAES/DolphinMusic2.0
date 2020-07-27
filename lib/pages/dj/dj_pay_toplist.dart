import 'package:dolphinmusic/common/apis/dj.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:flutter/material.dart';

class DjPayTopListWidget extends StatefulWidget {
  @override
  _DjPayTopListWidgetState createState() => _DjPayTopListWidgetState();
}

class _DjPayTopListWidgetState extends State<DjPayTopListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDjPayToplist(context),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.only(top:duSetWidth(40),left: duSetWidth(40),right: duSetWidth(40)),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('精品推荐',style: TextStyle(fontSize: duSetFontSize(36))),
                        Text('你值得拥有的优质内容',style: TextStyle(fontSize: duSetFontSize(24),color: Colors.black38)),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left:5,right:5),
                      child: Text('全部精选',style: TextStyle(fontSize: duSetFontSize(24),color: Colors.black87)),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(8)
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      for(int i=0;i<snapshot.data.data.list.length;i++)
                        Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.bottomLeft,
                              width: duSetWidth(210),
                              height: duSetWidth(210),
                              child: Container(
                                width: duSetWidth(210),
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  snapshot.data.data.list[i].name,
                                  style: TextStyle(color: Colors.white,fontSize: duSetWidth(24)),
                                  maxLines: 1,
                                  overflow:TextOverflow.ellipsis
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors:[Colors.black, Colors.transparent] 
                                  )
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage("${snapshot.data.data.list[i].picUrl}"),
                                  fit: BoxFit.fitHeight,
                                )
                              ),
                            ),
                            Container(
                              width: duSetWidth(210),
                              child: Text(
                                snapshot.data.data.list[i].creatorName,
                                style: TextStyle(fontSize: duSetFontSize(24)),
                                ),
                            )
                          ],
                        )
                    ],
                  ),
                )
              ]
            )
          );
        }else{
          return Text('loading');
        }
      }
    );
  }
  Future getDjPayToplist(context) async{
    return  DjApi.getDjPayToplist(context: context);
  }
}
import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:flutter/material.dart';

class DjPerferedWidget extends StatefulWidget {
  @override
  _DjPerferedWidgetState createState() => _DjPerferedWidgetState();
}

class _DjPerferedWidgetState extends State<DjPerferedWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDjPerfered(context),
      builder: (BuildContext context, AsyncSnapshot snapshot){
         if (snapshot.hasData) {
           return Container(
             padding: EdgeInsets.only(top:duSetWidth(40),left: duSetWidth(40),right: duSetWidth(40)),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                Text('电台推荐',style: TextStyle(fontSize: duSetFontSize(36))),
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      for(int i=0;i<snapshot.data.data.length;i++)
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
                                  snapshot.data.data[i].name,
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
                                  image: NetworkImage("${snapshot.data.data[i].picUrl}"),
                                  fit: BoxFit.fitHeight,
                                )
                              ),
                            ),
                            Container(
                              width: duSetWidth(210),
                              child: Text(
                                snapshot.data.data[i].rcmdText,
                                style: TextStyle(fontSize: duSetFontSize(24)),
                                ),
                            )
                          ],
                        )
                    ],
                  ),
                )
               ],
             ),
           );
         }else{
           return Text('loading');
         }
      }
    );
  }

  Future getDjPerfered(context) async{
    return  DjApi.getDjPerfered(context: context);
  }
}
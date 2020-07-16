import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/routers/routes.dart';

class DynamicHotTopic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getHotTopic(context),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.only(top:20),
            child: Wrap(
              runSpacing: 20,
              spacing: duSetWidth(20),
              children: <Widget>[
                for(int i=0;i<snapshot.data.hot.length;i++)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: duSetWidth(345),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: duSetWidth(345),
                          height: duSetWidth(500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data.hot[i].sharePicUrl),
                              fit: BoxFit.fitHeight,
                            )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:5,bottom:20),
                          child:  Text(snapshot.data.hot[i].title),
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
  Future getHotTopic(context) async{
    return  DynamicApi.getHotTopic(context: context);
  }
}
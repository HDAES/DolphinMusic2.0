
import 'package:dolphinmusic/model/model.dart';
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/common/utils/utils.dart';

class DiscoveryMv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMV(context),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left:10,top:10,bottom: 10),child:Text('推荐MV',style: TextStyle(fontWeight: FontWeight.bold,fontSize: duSetFontSize(32)))), 
              for(int i=0;i<3;i++)
              Column(
                children: <Widget>[
                  Container(
                    width: duSetWidth(710),
                    height: duSetWidth(350),
                    margin:EdgeInsets.only(left:10),
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage("${snapshot.data.result[i].picUrl}"),
                        fit: BoxFit.fitWidth,
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:3),
                    child: Text(snapshot.data.result[i].name,style: TextStyle(fontSize: duSetFontSize(30))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom:10),
                    child:Text(snapshot.data.result[i].copywriter,style: TextStyle(fontSize: duSetFontSize(24),color: Colors.black45))
                  ),
                ],
              )  
            ],
          );
        }else{
          return Text('loading');
        }
      }
    );
  }

  Future getMV(context) async{
    return  DiscoveryApi.getRecMvList(context: context);
  }
}
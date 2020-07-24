import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/common/utils/screen.dart';
import 'package:flutter/material.dart';
class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('排行榜',style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){ Navigator.pop(context);},
          child: Icon(Icons.arrow_back_ios,color: Colors.black),
        ),
      ),
      body:FutureBuilder(
        future: getTopList(context),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.hasData) {
            print(snapshot.data.list.length);
            return ListView(
              children: <Widget>[
                _officialRank(snapshot.data.list.take(4).toList()),
                _allRank(snapshot.data.list.skip(4).toList())
              ],
            );
          }else{
            return Text('loading');
          }
        }
      )
    );
  }

  //官方榜
  Widget _officialRank(officialList){
      return Container(
        padding: EdgeInsets.all(duSetWidth(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('官方榜',style: TextStyle(fontSize: duSetFontSize(42))),
            for(int i=0;i<officialList.length;i++)
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: duSetWidth(200),
                      width: duSetWidth(200),
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(top:10),
                      child: Padding(
                        padding: EdgeInsets.only(left:3,bottom:3),
                        child: Text(officialList[i].updateFrequency,style: TextStyle(color: Colors.white,fontSize: duSetFontSize(24))),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(officialList[i].coverImgUrl),
                          fit: BoxFit.fitHeight,
                        )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          for(int j =0;j<officialList[i].tracks.length;j++)
                            RichText(
                              text: TextSpan(
                                text: '${j+1}.',
                                style: TextStyle(color: Colors.black87),
                                children: [
                                  TextSpan(
                                    text: '${officialList[i].tracks[j].first}'
                                  ),
                                  TextSpan(
                                    text: ' - ',
                                    style: TextStyle(height: 2)
                                  ),
                                  TextSpan(
                                    text: '${officialList[i].tracks[j].second}'
                                  ),
                                ]
                              )
                            )
                        ],
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      );
  }

  //全部榜单
  Widget _allRank(officialList){
    return Container(
      padding: EdgeInsets.all(duSetWidth(40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('更多榜单',style: TextStyle(fontSize: duSetFontSize(42))),
          Wrap(
            spacing:duSetWidth(35),
            runSpacing:duSetWidth(5),
            children:[
              for(int i =0;i<officialList.length;i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: duSetWidth(200),
                      width:duSetWidth(200),
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(top:10),
                      child: Padding(
                        padding: EdgeInsets.only(left:3,bottom:3),
                        child: Text(officialList[i].updateFrequency,style: TextStyle(color: Colors.white,fontSize: duSetFontSize(24))),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(officialList[i].coverImgUrl),
                          fit: BoxFit.fitHeight,
                        )
                      ), 
                    ),
                    Container(
                      padding: EdgeInsets.only(top:2),
                      width: duSetWidth(200),
                      child: Text(officialList[i].name),
                    )
                  ],
                )
            ]
          )
          
        ],
      ),
    );
  }

  Future getTopList(context) async{
    return  DiscoveryApi.getTopList(context: context);
  }
}
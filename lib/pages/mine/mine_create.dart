import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/global.dart';
import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/model/model.dart';
import 'package:dolphinmusic/common/values/values.dart';

class MineCreate extends StatefulWidget {
  @override
  _MineCreateState createState() => _MineCreateState();
}

class _MineCreateState extends State<MineCreate> {
 
  bool myExpanded = false;
  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(context),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return Container(
            child: Column(
              children: <Widget>[
                ExpandableNotifier(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        ExpandablePanel(
                          header: Padding(
                            padding: EdgeInsets.only(top:10,bottom: 10),
                            child: Text(
                              "创建的歌单",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: duSetFontSize(30)),
                            )
                          ),
                          collapsed: _createList(snapshot.data),
                        )
                      ],
                    ),
                  ),
                ),
                ExpandableNotifier(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        ExpandablePanel(
                          header: Padding(
                            padding: EdgeInsets.only(top:10,bottom: 10),
                            child: Text(
                              "收藏的歌单",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: duSetFontSize(30)),
                            )
                          ),
                          collapsed: _collectList(snapshot.data),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          );
        }else{
          return Text('12312');
        }
      }
    );
  }

  Widget _createList(item){
    return Column(
      children: <Widget>[
        for(int i=0;i<item.playlist.length;i++)
        if(!item.playlist[i].ordered)
        _songItem(item.playlist[i]),
        _createSong()
      ],
    );
  }


  Widget _collectList(item){
    return Column(
      children: <Widget>[
        for(int i=0;i<item.playlist.length;i++)
        if(item.playlist[i].ordered)
        _songItem(item.playlist[i])
      ],
    );
  }

  Widget _songItem(item){
    return Padding(
      padding: EdgeInsets.only(bottom:5),
      child: Row(
        children: <Widget>[
          Image.network(item.coverImgUrl,width: 50),
          Padding(
            padding: EdgeInsets.only(left:10),
            child: GestureDetector(
              onTap: (){},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(item.name,style:TextStyle(fontSize: duSetFontSize(28),color: Colors.black87,fontWeight: FontWeight.bold)),
                  Text('${item.trackCount}首',style:TextStyle(fontSize: duSetFontSize(24),color: Colors.black38))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //创建歌单
  Widget _createSong(){
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  color: AppColors.interval,
                ),
                Positioned(
                  left: 10,
                  top:10,
                  child: Icon(Icons.add,color: Colors.black38,size: 30,),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left:10),
              child: Text('新建歌单'),
            )
          ],
        ),
      ),
    );
  }

  Future<MineSongListModel> getData(context) async{
    return  MineApi.getUserSongList(context: context);
  }
}
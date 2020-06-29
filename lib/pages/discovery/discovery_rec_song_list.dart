import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/common/utils/utils.dart';

class DiscoveryRecSongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: recSongList(context),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.only(top:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left:10),child:Text('推荐歌单',style: TextStyle(fontWeight: FontWeight.bold,fontSize: duSetFontSize(32)))), 
                  Container(
                    height: duSetWidth(280),
                    margin: EdgeInsets.only(top:duSetWidth(20)),
                    child: ListView.builder(
                      padding: EdgeInsets.only(right:10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext content, int index){
                        return _songItem(snapshot.data.result[index]);
                      },
                      itemCount: snapshot.data.result.length,
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

  Future recSongList(context) async{
    return  DiscoveryApi.getRecSongList(context: context);
  }

  ///推荐歌单item
  Widget _songItem(item){
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: duSetWidth(200),
        margin: EdgeInsets.only(left:10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: duSetWidth(200),
                  height: duSetWidth(200),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage("${item.picUrl}"),
                      fit: BoxFit.fitHeight,
                    )
                  ),
                ),
                Positioned(
                  top:0,
                  right: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.play_circle_outline,color: Colors.white,size: 14),
                      Text(
                        "${(item.playCount%1000).toString()}万",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top:2),
              child: Text(
              item.name,
              style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap:true
              ),
            )
          ],
        )
        
      ),
    );
  }
}
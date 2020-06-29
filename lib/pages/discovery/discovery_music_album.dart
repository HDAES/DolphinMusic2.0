/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-06-29 20:44:27
 * @LastEditTime: 2020-06-29 22:37:34
 */ 
import 'package:dolphinmusic/model/model.dart';
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/common/utils/utils.dart';

class DiscoveryMusicAlbum extends StatefulWidget {
  @override
  _DiscoveryMusicAlbumState createState() => _DiscoveryMusicAlbumState();
}

class _DiscoveryMusicAlbumState extends State<DiscoveryMusicAlbum> {

  int currentIndex=0;

  TextStyle _normalStyle = TextStyle(color: Colors.black,fontSize:duSetFontSize(32));
  TextStyle _selectStyle = TextStyle(color: Colors.black,fontSize:duSetFontSize(32),fontWeight: FontWeight.w700);
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
          return Padding(
            padding: EdgeInsets.only(left:10,right:10,top:10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){this.setState(() {currentIndex=0;});},
                      child: Text('新歌',style:currentIndex==0?_selectStyle:_normalStyle),
                    ),
                    Container(
                      width: 1,
                      margin: EdgeInsets.only(left:10,right:10),
                      color: Colors.black87,
                      child: Text(''),
                    ),
                    GestureDetector(
                      onTap: (){this.setState(() {currentIndex=1;});},
                      child: Text('新碟',style:currentIndex==1?_selectStyle:_normalStyle),
                    )
                  ],
                ),
                IndexedStack(
                  index: currentIndex,
                  children: <Widget>[
                    _item(snapshot.data['musicList'].result),
                    _items(snapshot.data['abumsList'].albums),
                  ],
                ),
              ],
            ),
          );
        }else{
          return Text('loading');
        }
      },
    );
  }

  Future getData(context) async{
    RecMusicListModel musicList = await DiscoveryApi.getRecMusicList(context: context);
    RecaAbumsListModel abumsList = await DiscoveryApi.getRecaAbumsList(context: context);
    return  {
      'musicList':musicList,'abumsList':abumsList
    };
  }


  Widget _item(item){
    return Container(
      margin: EdgeInsets.only(top:10),
      height: duSetHeight(250),
      child: GridView.builder(
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio:4
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){},
            child: Row(
              children: <Widget>[
                Container(
                  width: duSetWidth(80),
                  height: duSetWidth(80),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage("${item[index].picUrl}"),
                      fit: BoxFit.fitHeight,
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(item[index].name.length>15?item[index].name.substring(0, 15)+'...':item[index].name,style: TextStyle(color: Colors.black87,fontSize: duSetFontSize(28))),
                      Text(item[index].song?.artists[0].name,style: TextStyle(color: Colors.black45,fontSize: duSetFontSize(24)))
                    ],
                  ),
                )

              ],
            ),
           );
        }
      )
    );
  }

  Widget _items(item){
    return Container(
      margin: EdgeInsets.only(top:10),
      height: duSetHeight(250),
      child: GridView.builder(
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio:4
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){},
            child: Row(
              children: <Widget>[
                Container(
                  width: duSetWidth(80),
                  height: duSetWidth(80),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage("${item[index].picUrl}"),
                      fit: BoxFit.fitHeight,
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(item[index].name.length>15?item[index].name.substring(0, 15)+'...':item[index].name,style: TextStyle(color: Colors.black87,fontSize: duSetFontSize(28))),
                      Text(item[index].artist.name,style: TextStyle(color: Colors.black45,fontSize: duSetFontSize(24)))
                    ],
                  ),
                )

              ],
            ),
           );
        }
      )
    );
  }
  
}
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
          print(snapshot.data['musicList']);
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
                    Text('123'),
                    Text('1')
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

  
  
}
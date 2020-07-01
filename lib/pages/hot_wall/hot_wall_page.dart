import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/common/widgets/widgets.dart';

class HotWallPage extends StatefulWidget {
  @override
  _HotWallPageState createState() => _HotWallPageState();
}

class _HotWallPageState extends State<HotWallPage> {
  
  int currentIndex =0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PublicPageWidget(
      centerWidget:Text('热评墙',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: duSetFontSize(36))),
      widget:  FutureBuilder(
        future: getData(context),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                PageView(
                  onPageChanged: (index){
                    setState(() {
                      currentIndex=index;
                    });
                  },
                  children: <Widget>[
                    for(int i=0;i<snapshot.data.data.length;i++)
                    _hotItem(snapshot.data.data[i]),
                  ],
                ),
                Positioned(
                  top:50,
                  right: 20,
                  child: Text('${currentIndex+1}/${snapshot.data.data.length}',style: TextStyle(color: Colors.white)),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 70,
                  child: Container(
                    color: Colors.black.withOpacity(0.8),
                    child: Padding(
                       padding: EdgeInsets.only(left:20,top:10,right: 20),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('说点什么吧~',style: TextStyle(color: Colors.white38)),
                          Row(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.message,color: Colors.white,size: duSetFontSize(48)),
                                  Text('${snapshot.data.data[currentIndex].replyCount}',style: TextStyle(color: Colors.white,fontSize: 12))
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left:20,right:20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.thumb_up,color: Colors.white,size: duSetFontSize(48)),
                                    Text('${snapshot.data.data[currentIndex].likedCount}',style: TextStyle(color: Colors.white,fontSize: 12))
                                  ],
                                ),
                              ),
                              Icon(Icons.share,color: Colors.white,size: duSetFontSize(48))
                            ],
                          )
                        ],
                      ),
                    )       
                  ),
                )
              ],
            );
          }else{
            return Text('loading');
          }
        }
      )
    );
    
    
    
  }


  Widget _hotItem(item){
    return Stack(
      children: <Widget>[
        Image.network(
          item.simpleResourceInfo.songCoverUrl,
          height: duSetHeight(1500),
          width: duSetWidth(750),
          fit: BoxFit.fitHeight,
        ),
        BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: new Container(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top:100,left:20,right:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:40,bottom:40),
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: Image.network(item.simpleUserInfo.avatar,width: 50)
                    ),
                    Padding(padding: EdgeInsets.only(left:10),child: Text(item.simpleUserInfo.nickname,style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
              Text('“',style: TextStyle(fontSize: duSetFontSize(60),color: Colors.white)),
              Text(item.content,style: TextStyle(fontSize:item.content.length>50?duSetFontSize(30):duSetFontSize(60),color: Colors.white)),
              Padding(
                padding: EdgeInsets.only(top:5),
                child: Text(item.simpleResourceInfo.name+' - '+item.simpleResourceInfo.artists[0].name,
                  style: TextStyle(color: Colors.white38)
                ),
              )
            ],
          ),
        ) 
      ],
    );
  }



  Future getData(context) async{
    return  DynamicApi.getDynamic(context: context);
  }
}
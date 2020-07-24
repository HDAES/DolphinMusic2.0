/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-06-29 20:44:27
 * @LastEditTime: 2020-06-29 22:48:54
 */ 
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/apis/apis.dart';
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class DjBannerWidget extends StatefulWidget {
  @override
  _DjBannerWidgetState createState() => _DjBannerWidgetState();
}

class _DjBannerWidgetState extends State<DjBannerWidget>  with AutomaticKeepAliveClientMixin{
  
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: getBanner(context),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return Container(
            margin: EdgeInsets.only(top:10),
            height: duSetHeight(250),
            width: duSetWidth(750),
            child: Swiper(
              itemBuilder: (BuildContext content, int index){
                return Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(left:10,right:10),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: Text(snapshot.data.data[index].typeTitle,style: TextStyle(color: Colors.white,fontSize: duSetWidth(18)),),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomRight: Radius.circular(10))
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage("${snapshot.data.data[index].pic}"),
                      fit: BoxFit.fitHeight,
                    )
                  ),
                );
              },
              itemCount: snapshot.data.data.length,
              pagination: SwiperPagination(),
              autoplay: true,
            ),
          );
        }else{
          return Text('loading');
        }
      }
    );
    
  }
  Future getBanner(context) async{
    return  DjApi.getDjBanner(context: context);
  }
}
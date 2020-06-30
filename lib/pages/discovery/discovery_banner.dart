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

class DiscoveryBanner extends StatefulWidget {
  @override
  _DiscoveryBannerState createState() => _DiscoveryBannerState();
}

class _DiscoveryBannerState extends State<DiscoveryBanner> with AutomaticKeepAliveClientMixin{
 
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: getBanner(context),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return Container(
            height: duSetHeight(250),
            width: duSetWidth(750),
            child: Swiper(
              itemBuilder: (BuildContext content, int index){
                return Container(
                  margin: EdgeInsets.only(left:10,right:10),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage("${snapshot.data.banners[index].pic}"),
                    fit: BoxFit.fitHeight,
                  )
                ),
                );
              },
              itemCount: snapshot.data.banners.length,
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
    return  DiscoveryApi.getDiscoveryBanner(context: context);
  }
}
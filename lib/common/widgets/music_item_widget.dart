/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-07-23 22:30:13
 * @LastEditTime: 2020-07-23 22:48:09
 */ 
import 'package:dolphinmusic/common/utils/screen.dart';
import 'package:flutter/material.dart';

class MusicItemWidget extends StatefulWidget {
  final dynamic item;
  MusicItemWidget({this.item});
  @override
  _MusicItemWidgetState createState() => _MusicItemWidgetState();
}

class _MusicItemWidgetState extends State<MusicItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left:20,right:10),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(widget.item.album.picUrl),
                fit: BoxFit.fitHeight,
              )
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left:10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.item.name,style: TextStyle(color: Colors.black)),
                   RichText(
                      text: TextSpan(
                        text: widget.item.artists[0].name,
                        style: TextStyle(color: Colors.black45,fontSize: duSetFontSize(24)),
                        children: [
                          TextSpan(text: '-'),
                          TextSpan(text: widget.item.album.name),
                        ]
                      )
                   )
                ],
              ),
            ),
          ),
          Icon(Icons.more_vert,color: Colors.black45,)
        ],
      ),
    );
  }
}
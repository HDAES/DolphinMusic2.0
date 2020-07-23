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
      height: 50,
      child: Image.network(widget.item.album.blurPicUrl),
    );
  }
}
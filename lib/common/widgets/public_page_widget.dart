
import 'package:dolphinmusic/common/utils/screen.dart';
import 'package:flutter/material.dart';
class PublicPageWidget extends StatefulWidget {
  final  Widget widget;
  final Widget centerWidget;
  PublicPageWidget({this.widget,this.centerWidget});
  @override
  _PublicPageWidgetState createState() => _PublicPageWidgetState();
}

class _PublicPageWidgetState extends State<PublicPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          widget.widget,
          Container(
            padding: EdgeInsets.only(top:MediaQuery.of(context).padding.top),
            height: 80,
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                      onPressed: (){Navigator.pop(context);},
                    )
                  ],
                ),
                Positioned(
                  top:0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                    child: widget.centerWidget!=null? widget.centerWidget:Text(''),
                  ),
                )
              ],
            )
            
          ),
        ],
      ),
    );
  }
}
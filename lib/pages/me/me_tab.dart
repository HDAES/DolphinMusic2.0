
import 'package:dolphinmusic/common/utils/utils.dart';
import 'package:dolphinmusic/common/values/values.dart';
import 'package:flutter/material.dart';

class MeTab extends StatefulWidget {
  @override
  _MeTabState createState() => _MeTabState();
}

class _MeTabState extends State<MeTab> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: duSetHeight(1334),
      margin: EdgeInsets.only(top:30),
      width: duSetWidth(750),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 60,
                alignment: Alignment.center,
                child: Text('主页'),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2)
                  )
                ),
              ),
              Container(
                height: 60,
                alignment: Alignment.center,
                child: Text('动态'),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2)
                  )
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top:5),
            height: 1,
            color: AppColors.interval,
          ),
          Expanded(
            flex: 1,
            child: IndexedStack(
              index: currentIndex,
              children: <Widget>[
                Container(
                  color: Colors.yellow,
                  child: Text('123'),
                )
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight:Radius.circular(20),
          topLeft:Radius.circular(20)
        )
      ),
    );
  }
}
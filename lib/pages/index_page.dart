/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-06-28 21:31:34
 * @LastEditTime: 2020-06-28 22:45:14
 */ 
import 'package:flutter/material.dart';
import 'package:dolphinmusic/common/apis/apis.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){check(context);},
        child: Text('1312'),
      ),
    );
  }

  check(context){
    UserApi.loginStatus(context: context);
  }
}
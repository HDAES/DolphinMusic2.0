import 'package:flutter/material.dart';
import 'package:dolphinmusic/pages/login/stagger_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{

  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this
    );
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 750, height: 1334);
    return StaggerAnimation(
        controller: _controller
    );
  }
}
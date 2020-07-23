import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
         slivers: <Widget>[
           SliverAppBar(
             pinned: true,
             stretch: true,
             expandedHeight: 200.0,
             flexibleSpace: FlexibleSpaceBar(
               title: Text('开学季'),
               background: Image.network(
                 "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg",
                 fit: BoxFit.cover,
               ),
             ),
           ),
           SliverPadding(padding: EdgeInsets.only(top: 10),),
           SliverGrid(
             //调整间距
             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
               crossAxisSpacing: 10,
               maxCrossAxisExtent: 200,
               mainAxisSpacing: 10,
               childAspectRatio: 4.0
             ),
             //加载内容
             delegate: SliverChildBuilderDelegate(
                 (context,index) {
                   return Container( //设置每个item的内容
                     alignment: Alignment.center,
                     color: Colors.orangeAccent,
                     child: Text("$index"),
                   );
                 },
               childCount: 20, //设置个数
             ),
           ),
           SliverPadding(padding: EdgeInsets.only(top: 10),),
           SliverFixedExtentList(
             itemExtent: 50,
             //加载内容
             delegate: SliverChildBuilderDelegate(
                 (context, index) {
                   return Container(
                     alignment: Alignment.center,
                     color: Colors.deepPurpleAccent,
                     child: Text('$index'),
                   );
                 },
               //设置显示个数
               childCount: 20,
             ),
           )
         ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class CustomSliverHeaderDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverPersistentHeader(
//             pinned: true,
//             delegate: SliverCustomHeaderDelegate(
//               title: '哪吒之魔童降世',
//               collapsedHeight: 40,
//               expandedHeight: 300,
//               paddingTop: MediaQuery.of(context).padding.top,
//               coverImgUrl: 'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg@1280w_1l_2o_100sh.jpg'
//             ),
//           ),
//           SliverFillRemaining(
//             child: FilmContent(),
//           )
//         ],
//       ),
//     );
//   }
// }

// class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final double collapsedHeight;
//   final double expandedHeight;
//   final double paddingTop;
//   final String coverImgUrl;
//   final String title;
//   String statusBarMode = 'dark';

//   SliverCustomHeaderDelegate({
//     this.collapsedHeight,
//     this.expandedHeight,
//     this.paddingTop,
//     this.coverImgUrl,
//     this.title,
//   });

//   @override
//   double get minExtent => this.collapsedHeight + this.paddingTop;

//   @override
//   double get maxExtent => this.expandedHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }

//   void updateStatusBarBrightness(shrinkOffset) {
//     if(shrinkOffset > 50 && this.statusBarMode == 'dark') {
//       this.statusBarMode = 'light';
//       SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//         statusBarBrightness: Brightness.light,
//         statusBarIconBrightness: Brightness.light,
//       ));
//     } else if(shrinkOffset <= 50 && this.statusBarMode == 'light') {
//       this.statusBarMode = 'dark';
//       SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//         statusBarBrightness: Brightness.dark,
//         statusBarIconBrightness: Brightness.dark,
//       ));
//     }
//   }

//   Color makeStickyHeaderBgColor(shrinkOffset) {
//     final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
//     return Color.fromARGB(alpha, 255, 255, 255);
//   }

//   Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
//     if(shrinkOffset <= 50) {
//       return isIcon ? Colors.white : Colors.transparent;
//     } else {
//       final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
//       return Color.fromARGB(alpha, 0, 0, 0);
//     }
//   }

//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     this.updateStatusBarBrightness(shrinkOffset);
//     return Container(
//       height: this.maxExtent,
//       width: MediaQuery.of(context).size.width,
//       child: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Container(child: Image.network(this.coverImgUrl, fit: BoxFit.cover)),
//           Positioned(
//             left: 0,
//             top: this.maxExtent / 2,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color(0x00000000),
//                     Color(0x90000000),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             top: 0,
//             child: Container(
//               color: this.makeStickyHeaderBgColor(shrinkOffset),
//               child: SafeArea(
//                 bottom: false,
//                 child: Container(
//                   height: this.collapsedHeight,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       IconButton(
//                         icon: Icon(
//                           Icons.arrow_back_ios,
//                           color: this.makeStickyHeaderTextColor(shrinkOffset, true),
//                         ),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                       Text(
//                         this.title,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                           color: this.makeStickyHeaderTextColor(shrinkOffset, false),
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.share,
//                           color: this.makeStickyHeaderTextColor(shrinkOffset, true),
//                         ),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FilmContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(6),
//                 child: Image.network(
//                   'https://img1.gamersky.com/image2019/07/20190725_ll_red_136_2/gamersky_07small_14_201972510258D0.jpg',
//                   width: 130,
//                   height: 180,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(padding: EdgeInsets.only(left: 16)),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     '哪吒之魔童降世',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF333333),
//                     ),
//                   ),
//                   Padding(padding: EdgeInsets.only(top: 10)),
//                   Text(
//                     '动画/中国大陆/110分钟',
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Color(0xFF999999),
//                     ),
//                   ),
//                   Padding(padding: EdgeInsets.only(top: 2)),
//                   Text(
//                     '2019-07-26 08:00 中国大陆上映',
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Color(0xFF999999),
//                     ),
//                   ),
//                   Padding(padding: EdgeInsets.only(top: 2)),
//                   Text(
//                     '32.1万人想看/大V推荐度95%',
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Color(0xFF999999),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Divider(height: 32),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 '剧情简介',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF333333),
//                 ),
//               ),
//               Padding(padding: EdgeInsets.only(top: 10)),
//               Text(
//                 '天地灵气孕育出一颗能量巨大的混元珠，元始天尊将混元珠提炼成灵珠和魔丸，灵珠投胎为人，助周伐纣时可堪大用；而魔丸则会诞出魔王，为祸人间。元始天尊启动了天劫咒语，3年后天雷将会降临，摧毁魔丸。太乙受命将灵珠托生于陈塘关李靖家的儿子哪吒身上。然而阴差阳错，灵珠和魔丸竟然被掉包。本应是灵珠英雄的哪吒却成了混世大魔王。调皮捣蛋顽劣不堪的哪吒却徒有一颗做英雄的心。然而面对众人对魔丸的误解和即将来临的天雷的降临，哪吒是否命中注定会立地成魔？他将何去何从？',
//                 textAlign: TextAlign.justify,
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Color(0xFF999999),
//                 ),
//               ),
//               Text(
//                 '天地灵气孕育出一颗能量巨大的混元珠，元始天尊将混元珠提炼成灵珠和魔丸，灵珠投胎为人，助周伐纣时可堪大用；而魔丸则会诞出魔王，为祸人间。元始天尊启动了天劫咒语，3年后天雷将会降临，摧毁魔丸。太乙受命将灵珠托生于陈塘关李靖家的儿子哪吒身上。然而阴差阳错，灵珠和魔丸竟然被掉包。本应是灵珠英雄的哪吒却成了混世大魔王。调皮捣蛋顽劣不堪的哪吒却徒有一颗做英雄的心。然而面对众人对魔丸的误解和即将来临的天雷的降临，哪吒是否命中注定会立地成魔？他将何去何从？',
//                 textAlign: TextAlign.justify,
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Color(0xFF999999),
//                 ),
//               ),
//               Text(
//                 '天地灵气孕育出一颗能量巨大的混元珠，元始天尊将混元珠提炼成灵珠和魔丸，灵珠投胎为人，助周伐纣时可堪大用；而魔丸则会诞出魔王，为祸人间。元始天尊启动了天劫咒语，3年后天雷将会降临，摧毁魔丸。太乙受命将灵珠托生于陈塘关李靖家的儿子哪吒身上。然而阴差阳错，灵珠和魔丸竟然被掉包。本应是灵珠英雄的哪吒却成了混世大魔王。调皮捣蛋顽劣不堪的哪吒却徒有一颗做英雄的心。然而面对众人对魔丸的误解和即将来临的天雷的降临，哪吒是否命中注定会立地成魔？他将何去何从？',
//                 textAlign: TextAlign.justify,
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Color(0xFF999999),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';

// // class DemoPage extends StatefulWidget {
// //   @override
// //   _DemoPageState createState() => _DemoPageState();
// // }

// // class _DemoPageState extends State<DemoPage> with SingleTickerProviderStateMixin{
// //   TabController tabController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     this.tabController = TabController(length: 2, vsync: this);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: CustomScrollView(
// //         slivers: <Widget>[
// //           SliverAppBar(
// //             pinned: true,
// //             elevation: 0,
// //             expandedHeight: 250,
// //             flexibleSpace: FlexibleSpaceBar(
// //               title: Text('demo'),
// //               background: Image.network(
// //                 'http://img1.mukewang.com/5c18cf540001ac8206000338.jpg',
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //           ),
// //           SliverPersistentHeader(
// //             pinned: true,
// //             delegate: StickyTabBarDelegate(
// //               child: TabBar(
// //                 labelColor: Colors.black,
// //                 controller: this.tabController,
// //                 tabs: <Widget>[
// //                   Tab(text: 'Home'),
// //                   Tab(text: 'Profile'),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           SliverFillRemaining(
// //             child: TabBarView(
// //               controller: this.tabController,
// //               children: <Widget>[
// //                 Center(child: Text('Content of Home')),
// //                 Center(child: Text('Content of Profile')),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
// //   final TabBar child;

// //   StickyTabBarDelegate({@required this.child});

// //   @override
// //   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
// //     return this.child;
// //   }

// //   @override
// //   double get maxExtent => this.child.preferredSize.height;

// //   @override
// //   double get minExtent => this.child.preferredSize.height;

// //   @override
// //   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
// //     return true;
// //   }
// // }
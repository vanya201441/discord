// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
//
//
//
// class MyWidget extends StatefulWidget {
//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> with AutomaticKeepAliveClientMixin {
//
//   double value = 0;
//
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context); // вызывайте super.build(context) перед return
//
//     return Scaffold(
//
//         backgroundColor: Colors.grey.shade600,
//
//         body: Stack(
//           children: [
//
//         TweenAnimationBuilder(
//         tween: Tween<double>(begin: 0, end:value),
//         duration: Duration(microseconds: 500000),
//         curve: Curves.easeOutBack,
//         builder: (_,double val,__){
//           return(
//           Transform(
//             alignment: Alignment.center,
//             transform: Matrix4.identity()
//               ..setEntry(3, 2, 0.001)
//               ..setEntry(0, 3, 300 * val)
//               ..rotateX((pi / 6) * val),
//             child: ClipRRect(
//                  borderRadius: BorderRadius.circular(35),
//             child: Scaffold(
//                 backgroundColor: Colors.red,
//                 body: Stack(
//                   children: [
//                     // ваши дочерние элементы
//                   ],
//                 )
//             ),
//           ),
//           )
//           );
//         }
//     ),
//
//     GestureDetector(
//
//       onVerticalDragUpdate: (e) {
//         if (e.delta.dx > 0) {
//           setState(() {
//             value = 1;
//           }
//           );
//         } else {
//           setState(() {
//             value = 0;
//           }
//           );
//         }
//       }
//     )
//           ]
//     ),
//     );
//
//
//
//
//
//
//   }
//
//   @override
//   bool get wantKeepAlive => true;
// }
//
//
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       children: [
//         Container(color: Colors.grey,), // ваш виджет
//         MyWidget(),
//       ],
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
// // class Home extends StatefulWidget {
// //   const Home({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Home> createState() => _HomeState();
// // }
// //
// //
// // class _HomeState extends State<Home> {
// //
// //   double value = 0;
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //
// //       // appBar: AppBar(
// //       //   centerTitle: true,
// //       //   leading: DrawerWidget(),
// //       // ),
// //
// //       backgroundColor: Colors.grey.shade600,
// //
// //       //
// //       // body: Stack(
// //       //
// //       //   children: [
// //
// //       // body: Stack(
// //       //   children: [
// //
// // //       Container(
// // //               width: 200.0,
// // //               //padding: EdgeInsets.only(),
// // //               child: Column(
// // //                 children: [
// // //
// // //       DrawerHeader(child: Column(
// // //                     mainAxisAlignment: MainAxisAlignment.center,
// // //                     children: [
// // //                       CircleAvatar(
// // //                         radius: 50.0,
// // //                         backgroundColor: Colors.green,
// // //                       ),
// // //                       SizedBox(
// // //                         height: 10.0,
// // //                       ),
// // //                       Text("Ivan",style: TextStyle(color: Colors.white,fontSize: 20.0),),
// // //
// // //                     ],
// // //                   ),
// // //                   ),
// // //
// // //           Expanded(child: ListView(
// // //               children: [
// // //                 ListTile(
// // //                   onTap: (){},
// // //                   leading: Icon(Icons.home, color: Colors.white,),
// // //                   title: Text("Home"),
// // //                 ),
// // //                 ListTile(
// // //                   onTap: (){},
// // //                   leading: Icon(Icons.home, color: Colors.white,),
// // //                   title: Text("Home"),
// // //                 ),
// // //                 ListTile(
// // //                   onTap: (){},
// // //                   leading: Icon(Icons.home, color: Colors.white,),
// // //                   title: Text("Home"),
// // //                 ),
// // //                 ListTile(
// // //                   onTap: (){},
// // //                   leading: Icon(Icons.home, color: Colors.white,),
// // //                   title: Text("Home"),
// // //                 ),
// // //               ]
// // //           ),
// // //
// // //           ),
// // //
// // // ]
// // //               ),
// // //       ),
// // //
// // //
// // //
// // //         ],
// // //
// // //     ),
// //
// //
// //
// //
// //
// //
// //       body: Stack(
// //
// //         children: [
// //
// //
// //
// //
// //           Container(
// //
// //             width: 350,
// //             decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(75),
// //                 gradient: LinearGradient(
// //                   colors: [
// //                     Colors.grey.shade500,
// //                     Colors.grey.shade600
// //                   ],
// //                   begin: Alignment.bottomCenter,
// //                   end: Alignment.topCenter,
// //                 )
// //             ),
// //           ),
// //
// //
// //
// //           SafeArea(
// //
// //             child: Container(
// //               width: 200.0,
// //               padding: EdgeInsets.all(8.0),
// //               child: Column(
// //                 children: [
// //                   DrawerHeader(child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       CircleAvatar(
// //                         radius: 50.0,
// //                         backgroundColor: Colors.green,
// //                       ),
// //                       SizedBox(
// //                         height: 10.0,
// //                       ),
// //                       Text("Ivan",style: TextStyle(color: Colors.white,fontSize: 20.0),),
// //
// //                     ],
// //                   ),
// //                   ),
// //                   Expanded(child: ListView(
// //                       children: [
// //                         ListTile(
// //                           onTap: (){},
// //                           leading: Icon(Icons.home, color: Colors.white,),
// //                           title: Text("Home"),
// //                         ),
// //                         ListTile(
// //                           onTap: (){},
// //                           leading: Icon(Icons.home, color: Colors.white,),
// //                           title: Text("Home"),
// //                         ),
// //                         ListTile(
// //                           onTap: (){},
// //                           leading: Icon(Icons.home, color: Colors.white,),
// //                           title: Text("Home"),
// //                         ),
// //                         ListTile(
// //                           onTap: (){},
// //                           leading: Icon(Icons.home, color: Colors.white,),
// //                           title: Text("Home"),
// //                         ),
// //                       ]
// //                   ),
// //
// //                   ),
// //                 ],
// //               ),
// //             ),
// //
// //           ),
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //           TweenAnimationBuilder(tween: Tween<double>(begin: 0, end:value),
// //               duration: Duration(microseconds: 500000),
// //               curve: Curves.easeOutBack,
// //               builder: (_,double val,__){
// //                 return(
// //                     Transform(
// //                       alignment: Alignment.center,
// //                       transform: Matrix4.identity()
// //                         ..setEntry(3, 2, 0.001)
// //                         ..setEntry(0, 3, 300 * val)
// //                         ..rotateX((pi / 6) * val),
// //                       child: ClipRRect(
// //                         borderRadius: BorderRadius.circular(35),
// //                         child: Scaffold(
// //                             backgroundColor: Colors.red,
// //                             body: Stack(
// //                               children: [
// //
// //
// //                               ],
// //                             )
// //
// //
// //                         ),
// //                       ),
// //                     )
// //
// //                 );
// //               }
// //
// //           ),
// //
// //
// //
// //
// //           GestureDetector(
// //
// //             onHorizontalDragUpdate: (e){
// //               if(e.delta.dx > 0){
// //                 setState(() {
// //                   value = 1;
// //
// //                 }
// //                 );
// //               }else{
// //                 setState(() {
// //                   value = 0;
// //                 });
// //               }
// //             },
// //           )
// //
// //
// //         ],
// //
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
















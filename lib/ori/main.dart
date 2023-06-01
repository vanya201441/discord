// import 'package:flutter/material.dart';
// import 'package:bokov/auth_screen.dart';
// import 'exzample/exz1.dart';
// import 'constants.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
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
// // class MyApp extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Flutter Animation',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         inputDecorationTheme: InputDecorationTheme(
// //           filled: true,
// //           fillColor: Colors.white38,
// //           border: InputBorder.none,
// //           hintStyle: TextStyle(color: Colors.white),
// //           contentPadding: EdgeInsets.symmetric(
// //             vertical: defpaultPadding * 1.2, horizontal: defpaultPadding
// //           ),
// //         )
// //
// //         // inputDecorationTheme: InputDecorationTheme(
// //         //   filled: true,
// //         //   fillColor: Colors.white38,
// //         //   border: InputBorder.none,
// //         //   hintStyle: TextStyle(color: Colors.white),
// //         //   contentPadding: EdgeInsets.symmetric(
// //         //       vertical: defpaultPadding * 1.2, horizontal: defpaultPadding),
// //         // ),
// //       ),
// //       home: AuthScreen(),
// //     );
// //   }
// // }






// import 'package:flutter/material.dart';
//
// import 'overlapping_panels.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   //const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: OverlappingPanels(main: build(context),),
//     );
//   }
// }
















import 'package:bokov/ori/overlapping_panels.dart';
import 'package:flutter/material.dart';
import '../data.dart';
import 'list_main.dart';
//import 'package:bokov/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(title: '',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset footerOffset = const Offset(0, 1);

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        OverlappingPanels(
          left: Builder(builder: (context) {
            return const LeftPage();
          }),
          // right: Builder(
          //   builder: (context) => const RightPage(),
          // ),
          main: Builder(
            builder: (context) {
              return const MainPage();
            },
          ),
          onSideChange: (side) {
            setState(() {
              if (side == RevealSide.main) {
                footerOffset = const Offset(0, 1);
              } else if (side == RevealSide.left) {
                footerOffset = const Offset(0, 0);
              }
            });
          },
        ),

      ],
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  final bool _isPressed = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.grey.shade600,


        appBar: PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: AppBar(
            backgroundColor: Colors.grey.shade600,
          ),
        ),


       //  body:
       // Expanded(
       //  //
       //  child:ListView(
       //    children: [
       //      ListTile(title: Text('Element 1')),
       //      ListTile(title: Text('Element 2')),
       //      ListTile(title: Text('Element 3')),
       //    ],
       //  ),
       //  ),


//       appBar: AppBar(
//         backgroundColor: Colors.grey.shade600.withOpacity(0.99),
//   // shape: ContinuousRectangleBorder(
//   //   borderRadius: BorderRadius.circular(17),
//   // ),
//   // title: Row(
//   //   children: [
//   //     Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: [
//   //         Row(children: const [
//   //           Text(
//   //             '@',
//   //             style: TextStyle(color: Colors.white54),
//   //           ),
//   //           Text('notgr')
//   //         ]),
//   //         const Text(
//   //           'Playing Fornite Creative',
//   //           style: TextStyle(color: Colors.white54, fontSize: 12),
//   //         )
//   //       ],
//   //     ),
//   //   ],
//   // ),
//   // leading: IconButton(
//   //   icon: const Icon(Icons.menu),
//   //   onPressed: () {
//   //     OverlappingPanels.of(context)?.reveal(RevealSide.left);
//   //   },
//   // ),
//   // actions: [
//   //   IconButton(
//   //     icon: const Icon(Icons.call),
//   //     onPressed: () {
//   //       OverlappingPanels.of(context)?.reveal(RevealSide.right);
//   //     },
//   //   ),
//   //   IconButton(
//   //     icon: const Icon(Icons.camera_alt),
//   //     onPressed: () {
//   //       OverlappingPanels.of(context)?.reveal(RevealSide.right);
//   //     },
//   //   ),
//   //   IconButton(
//   //     icon: const Icon(Icons.group),
//   //     onPressed: () {
//   //       OverlappingPanels.of(context)?.reveal(RevealSide.right);
//   //     },
//   //   )
//   // ],
// ),

        // body: Container(
        //   // padding: EdgeInsets.only(top: 30),
        //
        //   //height: 800,
        //   decoration: BoxDecoration(
        //       color: Colors.grey.shade400,
        //       borderRadius: BorderRadius.circular(16)),
        // ),




// body: ListView(
//   children: [...chat, ...chat]
//       .map((chatEntry) => ListTile(
//     contentPadding:
//     const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
//     leading: CircleAvatar(
//       foregroundImage: NetworkImage(chatEntry['user']['avatar']),
//     ),
//     title: Row(
//       children: [
//         Text(
//           chatEntry['user']['name'],
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(
//           width: 16,
//         ),
//         Text(
//           chatEntry["time"],
//           style:
//           const TextStyle(color: Colors.grey, fontSize: 12),
//         )
//       ],
//     ),
//     subtitle: Text(
//       chatEntry['message'],
//       style: const TextStyle(fontSize: 16),
//     ),
//     onTap: () {},
//     onLongPress: () {},
//   ))
//       .toList(),
// ),

      //),
    );
  }
}







class LeftPage extends StatelessWidget {
  const LeftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: SafeArea(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                      ],
                    )
                ),
              ),
            ),
            Container(
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}


























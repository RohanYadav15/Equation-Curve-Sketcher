import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texster/providers/curve_screen_provider.dart';
import 'package:texster/utils/constants.dart';

import 'frontend/screens/curve_screen.dart';

void main() {
  return runApp(AnimatedApp());
}

class AnimatedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: kScaffoldColor,
        body: SafeArea(
          child: ChangeNotifierProvider(
            create: (context) => CurveModel(),
            child: CurveScreen(),
          ),
        ),
      ),
    );
  }
}


// class _AnimatedAppState extends State<AnimatedApp> {
//   // Animation? animation2;
//   // Animation? animation1;
//   // AnimationController? controller;
//   @override
//   void initState() {
//     super.initState();

//     // controller = AnimationController(
//     //   vsync: this,
//     //   duration: Duration(
//     //     seconds: 2,
//     //   ),
//     //   //lowerBound: 1.00,
//     //   //upperBound: 200.0,
//     //   //reverseDuration: Duration(seconds: 2),
//     // );

//     // animation1 = CurvedAnimation(parent: controller!, curve: Curves.easeInSine);
//     // controller!.addStatusListener((status) {
//     //   if (status == AnimationStatus.completed) {
//     //     controller!.reverse();
//     //   } else if (status == AnimationStatus.dismissed) {
//     //     controller!.forward();
//     //   }
//     // });
//     // //controller!.forward();
//     // controller!.addListener(() {
//     //   setState(() {});
//     // });
//   }

//   bool isbig = false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       body: Center(
//         child: GestureDetector(
//           onTap: () => setState(() => isbig = !isbig),
//           child: AnimatedContainer(
//             decoration:
//                 BoxDecoration(shape: BoxShape.circle, color: Colors.red),
//             duration: Duration(milliseconds: 300),
//             width: isbig ? 250 : 260,
//             height: isbig ? 125 : 135,
//             curve: Curves.easeIn,
//             onEnd: () {
//               setState(() {
//                 isbig = !isbig;
//               });
//             },
//           ),
//         ),
//       ),
//     ));
//   }
// }

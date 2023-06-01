library overlapping_panels;

import 'package:flutter/material.dart';
import 'dart:core';

const double bleedWidth = 20;

enum RevealSide { left, right, main }


class OverlappingPanels extends StatefulWidget {
  final Widget? left;

  final Widget main;

  //final Widget? right;


  final double restWidth;

  final ValueChanged<RevealSide>? onSideChange;

  const OverlappingPanels({this.left,
    required this.main,
    this.restWidth = 40,
    this.onSideChange,
    Key? key})
      : super(key: key);

  static OverlappingPanelsState? of(BuildContext context) {
    return context.findAncestorStateOfType<OverlappingPanelsState>();
  }

  @override
  State<StatefulWidget> createState() {
    return OverlappingPanelsState();
  }
}

class OverlappingPanelsState extends State<OverlappingPanels> with TickerProviderStateMixin {
  bool _isPressed = false;
  AnimationController? controller;
  double translate = 0;
  bool _isGestreEnabled = false;
  bool _isExpanded = false;
  List<String> _myList = ['Item 1', 'Item 2', 'Item 3'];



  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10)).then((_){
      setState(() {
        _isGestreEnabled = true;
      });
    });
  }







  double _calculateGoal(double width, int multiplier) {
    return (multiplier * width) + (-multiplier * widget.restWidth);
  }

  void _onApplyTranslation() {
    final mediaWidth = MediaQuery
        .of(context)
        .size
        .width;


    final animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.onSideChange != null) {
          widget.onSideChange!(translate == 0
              ? RevealSide.main
              : (translate > 0 ? RevealSide.left : RevealSide.right));
        }
        animationController.dispose();
      }
    });

    if (translate.abs() >= mediaWidth / 2) {
      final multiplier = (translate > 0 ? 1 : -1);
      final goal = _calculateGoal(mediaWidth, multiplier);
      final Tween<double> tween = Tween(begin: translate, end: goal);
      print('Goal value: $goal');

      final animation = tween.animate(animationController);

      animation.addListener(() {
        setState(() {
          translate = animation.value;
          // if(translate == goal){
          //   _isPressed ? 1.2 : 0.8;
          //   setState(() {
          //
          //   });
          // }
        });
      });
    } else {
      final animation =
      Tween<double>(begin: translate, end: 0).animate(animationController);

      animation.addListener(() {
        setState(() {
          translate = animation.value;
          // if(translate == 0){
          //   _isPressed ? 1.0 : 1.2;
          //   setState(() {
          //
          //   });
          // }
        });
      });
    }

    animationController.forward();
  }

  void reveal(RevealSide direction) {
    if (translate != 0) {
      return;
    }

    final mediaWidth = MediaQuery
        .of(context)
        .size
        .width;

    final multiplier = (direction == RevealSide.left ? 1 : -1);
    final goal = _calculateGoal(mediaWidth, multiplier);

    final animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _onApplyTranslation();
        animationController.dispose();
      }
    });

    final animation =
    Tween<double>(begin: translate, end: goal).animate(animationController);

    animation.addListener(() {
      setState(() {
        translate = animation.value;
      });
    });

    animationController.forward();
  }

  void onTranslate(double delta) {
    setState(() {
      final translate = this.translate + delta;
      //translate < 0 && widget.right != null ||
      if (
          translate > 0 && widget.left != null) {
        this.translate = translate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(

            children: [

          Offstage(
            offstage: translate < 0,
            child: widget.left,
          ),
          // Offstage(
          //   offstage: translate > 0,
          //   child: widget.right,
          // ),

          Container(
            padding: EdgeInsets.only(top: 35.9),
            child: GestureDetector(
              onTapDown: (_) => setState(() => _isPressed = true),
              onTapUp: (_) => setState(() => _isPressed = false),
              child: Transform.scale(
                scaleY: _isPressed ? 1.2 : 1.0,
                //child: Expanded(
                child: Container(
                  child: widget.main,
                //),
              ),
              ),
            ),
            transform: Matrix4.translationValues(translate, 0, 0),
          ),



          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onHorizontalDragUpdate: (details) {
              onTranslate(details.delta.dx);
            },
            onHorizontalDragEnd: (details) {
              _onApplyTranslation();

            },



          ),


              // Container(
              //   padding: EdgeInsets.only(top: 35.9),
              //   child: GestureDetector(
              //     onTapDown: (_) => setState(() => _isPressed = true),
              //     onTapUp: (_) => setState(() => _isPressed = false),
              //     child: DecoratedBox(
              //
              //       decoration: BoxDecoration(
              //         color: Colors.red
              //       ),
              //       child:
              //       //Expanded(
              //         //child:
              //       Container(
              //           height: _isPressed ? 1000.0 : 870.0,
              //           width: 410,
              //           child: widget.main,
              //         ),
              //       //),
              //
              //
              //     ),
              //   ),
              //   transform: Matrix4.translationValues(translate, 0, 0),
              // ),
              // GestureDetector(
              //   behavior: HitTestBehavior.translucent,
              //   onHorizontalDragUpdate: (details) {
              //     onTranslate(details.delta.dx);
              //   },
              //   onHorizontalDragEnd: (details) {
              //     _onApplyTranslation();
              //   },
              // ),





            ]
        ),
      );
  }
}


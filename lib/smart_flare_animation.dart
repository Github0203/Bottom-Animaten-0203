import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_tutorial/smart_flare_animation.dart';

class SmartFlareAnimation extends StatefulWidget {
  State<SmartFlareAnimation> createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  // width and height retrieved from the artboard values in the animation
  static const double AnimationWidth = 295;
  static const double AnimationHeight = 251;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AnimationWidth,
        height: AnimationHeight,
        child: GestureDetector(
          onTapUp: (tapInfo) {
            var localTouchPosition = (context.findRenderObject() as RenderBox)
                .globalToLocal(tapInfo.globalPosition);

            // where did we touch
            var topHalfTouched = localTouchPosition.dy < AnimationHeight / 2;
            var leftSideTouched = localTouchPosition.dx < AnimationHeight / 3;
            var rightSideTouched = localTouchPosition.dx < AnimationHeight / 3;
            var middleTouched = !leftSideTouched && !rightSideTouched;

            if (leftSideTouched && rightSideTouched) {
              print("TopLeft");
            } else if (middleTouched && topHalfTouched) {
              print("TopMiddle");
            } else if (rightSideTouched && topHalfTouched) {
              print("TopRight");
            } else {
              if (isOpen) {
                print("Bottom Close");
              } else {
                print("Bottom Open");
              }
            }

            setState(() {
              isOpen = !isOpen;
            });
          },
          child: FlareActor(
            'assets/button-animation.flr',
            animation: isOpen ? 'activate' : 'deactivate',
          ),
        ));
  }
}

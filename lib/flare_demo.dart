import 'package:flutter/material.dart';
import 'package:flare_tutorial/smart_flare_animation.dart';
import 'package:smart_flare/smart_flare.dart';

class FlareDemo extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<FlareDemo> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    var animationWidth = 251.0;
    var animationHeight = 295.0;
    var animationWidthThirds = animationWidth / 3;
    var halfAnimationHeight = animationHeight / 2;

    var activeAreas = [
      // Top left area
      ActiveArea(
          area: Rect.fromLTWH(0, 0, animationWidthThirds, halfAnimationHeight),
          debugArea: true,
          animationName: 'camera_tappted'),

      ActiveArea(
          area: Rect.fromLTWH(
              0, animationHeight / 2, animationWidth, animationHeight / 2),
          debugArea: true,
          animationsToCycle: ['activate', 'deactivate'],
          onAreaTapped: () {
            print('Toggle animation');
          })
    ];

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 102, 18, 222),
        body: Align(
            alignment: Alignment.bottomCenter,
            child: SmartFlareActor(
              width: animationWidth,
              height: animationHeight,
              filename: 'assets.button-animation.flr',
              // startingAnimation: 'deactivate',
              activeAreas: activeAreas,
            )));
  }
}

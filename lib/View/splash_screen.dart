import 'dart:async';

import 'package:covid_19/View/world_states.dart';
import 'package:flutter/material.dart';
import "dart:math" as math;

import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => WorldStatesScreen())));
  }

  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _animationController,
                child: Container(
                  height: 200,
                  width: 200,
                  child: const Center(
                      child: Image(image: AssetImage("images/virus.png"))),
                  // child:Text("picture")
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _animationController.value * 2.0 * math.pi,
                    child: child,
                  );
                }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            const Align(
              alignment: Alignment.center,
              child: Text("Covid-19\nTracker App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import 'circle.dart';
// import 'package:audioplayers/audioplayers.dart';

class Balloon extends StatefulWidget {
  final int T4;
  Balloon({required this.T4});

  @override
  _Balloon createState() => _Balloon();
}

class _Balloon extends State<Balloon> {
  late int t;
  double top = 320;
  double r = 240;
  int sec = 30;
  late Timer _timer;
  // AudioCache audioCache = AudioCache();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  sec.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
                SizedBox(
                  height: 430,
                  width: 360,
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;

                              _timer.cancel();
                            });
                          },
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Ink.image(
                              image: const AssetImage('image/balloon.png'),
                              child: Visibility(
                                visible: isVisible,
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                child: Image.asset("image/balloonp.jpg"),
                              ),
                            ),
                          ),
                        ),
                        duration: const Duration(seconds: 4),
                        top: top,
                        right: r,
                      )
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                          setState(() {
                            top = 0;
                            r = 0;
                            if (sec > 0) {
                              sec--;
                            } else {
                              _timer.cancel();
                            }
                          });
                        });
                      },
                      child: const Text(
                        'بدء',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.deepPurple,
                    ),
                    MaterialButton(
                      onPressed: () {
                        t = widget.T4+(30-sec);
                        _timer.cancel();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Circle(T5: t,)));
                      },
                      child: const Text(
                        'المستوى التالي',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.deepPurple,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

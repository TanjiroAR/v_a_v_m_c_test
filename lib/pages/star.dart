import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'car.dart';

class Star extends StatefulWidget {
  final int T2;
  Star({required this.T2});

  @override
  _Star createState() => _Star();
}

class _Star extends State<Star> {
  late int t;
  int sec = 30;
  late Timer _timer;
  bool a = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Text(
                sec.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
              Container(
                height: 400,
                color: Colors.black,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      a = false;
                      _timer.cancel();
                    });
                  },
                  child: Lottie.asset(
                    "image/star.json",
                    animate: a,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                          setState(() {
                            a = true;
                            if (sec > 0) {
                              sec--;
                            } else {
                              _timer.cancel();
                            }
                          });
                        });
                      });
                    },
                    child: const Text(
                      'بدء',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.deepPurple,
                  ),
                  MaterialButton(
                    onPressed: () {
                      t = widget.T2+(30-sec);
                      _timer.cancel();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  CarMove(T3: t,)));
                    },
                    child: const Text(
                      'المستوى التالي',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.deepPurple,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'balloon_pop.dart';

class CarMove extends StatefulWidget {
  final int T3;
  CarMove({required this.T3});

  @override
  _CarMove createState() => _CarMove();
}

class _CarMove extends State<CarMove> {
  late int t;
  int sec = 30;
  late Timer _timer;
  bool a = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                sec.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    a = false;
                    _timer.cancel();
                    // int x=sec;
                    // print(30-x);

                  });
                },
                child: Lottie.asset(
                  "image/car1.json",
                  animate: a,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                        setState(() {
                          if (sec > 0) {
                            sec--;
                          } else {
                            _timer.cancel();
                            a = false;
                          }
                        });
                      });
                      setState(() {
                        a = true;
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
                      t = widget.T3+(30-sec);
                      _timer.cancel();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Balloon(T4: t,)));
                    },
                    child: const Text(
                      'المسنوى التالي',
                      style: TextStyle(color: Colors.white),
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


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:v_a_v_m_c_test/pages/star.dart';

class Light extends StatefulWidget {
  const Light({Key? key}) : super(key: key);

  @override
  _Light createState() => _Light();
}

class _Light extends State<Light> {
  late int t;
  double op = 1;
  double he = 100;
  double wi = 100;
  int sec = 30;
  late Timer _timer;
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
              TextButton(
                onPressed: () {
                  setState(() {
                    _timer.cancel();

                  });
                },
                child: AnimatedOpacity(
                    duration: const Duration(seconds: 30),
                    opacity: op,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 30),
                      height: he,
                      width: wi,
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "image/22b.png",
                      ),
                    )),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        op = 1;
                        he = 400;
                        wi = 300;
                        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                          setState(() {
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
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                  ),
                  MaterialButton(
                    onPressed: () {
                      t = 30-sec;
                      _timer.cancel();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Star(T2: t,)));
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
      ),
    );
  }
}

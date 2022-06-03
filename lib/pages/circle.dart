import 'dart:async';

import 'package:flutter/material.dart';
import 'package:v_a_v_m_c_test/pages/score.dart';

class ItemModel {
  final String name;
  final String img;
  final String value;
  bool accepting;
  ItemModel(
      {required this.name,
      required this.value,
      required this.img,
      this.accepting = false});
}

class Circle extends StatefulWidget {
  static Object? t1;

  final int T5;
  Circle({required this.T5});

  @override
  _Circle createState() => _Circle();
}

class _Circle extends State<Circle> {
  late int t;
  late List<ItemModel> items;
  late List<ItemModel> items2;
  late int score;
  late bool gameOver;
  bool b = false;
  int sec = 30;
  late Timer _timer;

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(value: 'احمر', name: 'احمر', img: 'image/r.png'),
      ItemModel(value: 'اخضر', name: 'اخضر', img: 'image/g.png'),
      ItemModel(value: 'اصفر', name: 'اصفر', img: 'image/y.png'),
    ];
    items2 = List<ItemModel>.from(items);

    items.shuffle();
    items2.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) { gameOver = true;}
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                sec.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'النقاط: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.teal),
                      ),
                      TextSpan(
                        text: '$score',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.teal),
                      ),
                    ],
                  ),
                ),
              ),
              if (!gameOver)
                Row(
                  children: [
                    const Spacer(),
                    Column(
                      children: items.map((item) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          child: Draggable<ItemModel>(
                            data: item,
                            childWhenDragging: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(item.img),
                              radius: 50,
                            ),
                            feedback: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(item.img),
                              radius: 30,
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(item.img),
                              radius: 30,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const Spacer(flex: 2),
                    Column(
                      children: items2.map((item) {
                        return DragTarget<ItemModel>(
                          onAccept: (receivedItem) {
                            if (item.value == receivedItem.value) {
                              setState(() {
                                items.remove(receivedItem);
                                items2.remove(item);
                              });
                              score += 10;
                              item.accepting = false;
                            } else {
                              setState(() {
                                score -= 5;
                                item.accepting = false;
                              });
                            }
                          },
                          onWillAccept: (receivedItem) {
                            setState(() {
                              item.accepting = true;
                            });
                            return true;
                          },
                          onLeave: (receivedItem) {
                            setState(() {
                              item.accepting = false;
                            });
                          },
                          builder: (context, acceptedItems, rejectedItems) =>
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: item.accepting
                                        ? Colors.grey[400]
                                        : Colors.grey[200],
                                  ),
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.width / 6.5,
                                  width: MediaQuery.of(context).size.width / 3,
                                  margin: const EdgeInsets.all(8),
                                  child: Image.asset(item.img)
                                  // Text(
                                  //   item.name,
                                  //   style:
                                  //       Theme.of(context).textTheme.headline6,
                                  // )
                              ),
                        );
                      }).toList(),
                    ),
                    const Spacer(),
                  ],
                ),
              if (gameOver)
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'انتهت اللعبة',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          result(),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ],
                  ),
                ),
              if (gameOver)
                Container(
                  height: MediaQuery.of(context).size.width / 10,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          initGame();
                        });
                      },
                      child: const Text(
                        'ابدء من جديد',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      b = !b;
                      if (b == true) {
                        _timer =
                            Timer.periodic(const Duration(seconds: 1), (timer) {
                              setState(() {
                                if (sec > 0) {
                                  sec--;
                                } else {
                                  _timer.cancel();
                                }
                              });
                            });
                      } else {
                        _timer.cancel();
                      }
                    },
                    child: const Text(
                      "بدء",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                  ),
                  MaterialButton(
                    onPressed: () {
                      t = widget.T5+(30-sec);

                      _timer.cancel();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Score(total: t,)));
                    },
                    child: const Text(
                      'النتيجة',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  //Functions:

  String result() {
    if (score == 30) {
      return 'مبروك';
    } else {
      return '';
    }
  }
}


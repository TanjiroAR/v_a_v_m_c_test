import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  final int total;
  Score({required this.total});
  @override
  _Score createState() => _Score();
}

class _Score extends State<Score> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.total.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            const Text(':النتيجة', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold ),textAlign: TextAlign.right,)
          ],
        ),
      )),
    );
  }
}

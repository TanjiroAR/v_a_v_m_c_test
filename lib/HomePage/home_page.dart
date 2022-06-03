import 'package:flutter/material.dart';
import '../pages/circle.dart';
import 'list_image.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Home2State createState() => Home2State();
}

class Home2State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(""),
      ),

      /// get LisImage
      body: const Lists(),
      backgroundColor: Colors.grey,
    );
  }

}

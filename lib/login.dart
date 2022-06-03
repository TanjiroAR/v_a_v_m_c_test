
import 'package:flutter/material.dart';

import 'HomePage/home_page.dart';

class TutorialHome extends StatelessWidget {
  const TutorialHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Design widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('V.A.V.M.C.Test'),
      ),
      // body is the majority of the screen.
      body: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          buildInputField(context, "اسم المستخدم", Icons.account_circle, false),

          Container(
              margin: const EdgeInsets.only(top: 26.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                child: const Text(
                  'تسجيل',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    onPrimary: Colors.white
                ),
              ))
        ],
      ),
    );
  }
}

/// create InputField
Widget buildInputField(
    BuildContext context, String hint, IconData iconData, bool isPassword) {
  return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            color: const Color(0xFFff6347),
          ),
          Flexible(
              child: TextField(
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration.collapsed(hintText: hint),
                obscureText: isPassword,
              )),
        ],
      ));
}




import 'package:flutter/material.dart';
import 'package:v_a_v_m_c_test/pages/balloon_pop.dart';
import 'package:v_a_v_m_c_test/pages/car.dart';
import 'package:v_a_v_m_c_test/pages/circle.dart';
import 'package:v_a_v_m_c_test/pages/star.dart';
import '../pages/light.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  _Lists createState() => _Lists();
}

class _Lists extends State<Lists> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        lightCard(),
        starCard(),
        carCard(),
        balloonCard(),
        circleCard(),
      ],
    );
  }

  ///score
  // Widget score() => Card(
  //   clipBehavior: Clip.antiAlias,
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(24),
  //   ),
  //   child: Container(
  //     child: Center(
  //       child: Text("Score: ", style: TextStyle(fontSize: 30),),
  //     ),
  //   ),
  // );
  ///light list
  Widget lightCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: const AssetImage("image/light.jpg"),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Light()));
                    },
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    ' المستوى الاول : مستوى الحساسية للضوء',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                ' الانتباه دون انزعاج عند التعرض لضوء منخفض و'
                ' الانتباه دون انزعاج للضوء المرتفع',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );

  ///star list
  Widget starCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: const AssetImage("image/654.jpg"),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Star(T2: 0,)));
                    },
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    ' المستوى الثاني : بداية الاستقبال البصري',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                " الانتباه البصري الاول لنجم مضئ ثابت يظهر على خلفية مظلمة ثم يختفي لمدة ٣٠ ثانية",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );

  ///car list
  Widget carCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: const AssetImage("image/15.png"),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  CarMove(T3: 0,)));
                    },
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    ' المستوى الثالث : متابعة سيارة تتحرك',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                'متابعة سيارة تتحرك و تتوقف عند الضغط عليها',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );

  ///balloon list
  Widget balloonCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: const AssetImage("image/13.png"),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Balloon(T4: 0,)));
                    },
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    ' المستوى الرابع :  طول مدة استمرار الادراك البصري',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                'استمرار الادراك البصري و متابعة بالونة حمراء و محاولة تفجيرها',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );

  ///circle list
  Widget circleCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: const AssetImage("image/16.png"),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Circle(T5: 0,)));
                    },
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    ' المستوى الخامس :  مقارنة الاشكال',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                'مطابقة كرة لكرة اخرى بنفس اللون و الحجم',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );
}

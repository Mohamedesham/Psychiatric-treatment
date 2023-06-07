import 'package:final_graduation_project/screens/choose_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            Center(
                child: Image.asset(
              "assets/Psychologist-amico.png",
              height: 300,
              width: 300,
            )),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome to,',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Color.fromRGBO(0, 82, 152, 1))),
                  Text('Psychiatric Treatment App',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromRGBO(0, 0, 0, 100))),
                ],
              ),
            ),
            const SizedBox(
              height: 180,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(ChosseAccount());
                  },
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(5),
                      backgroundColor: Color.fromRGBO(0, 82, 152, 1)),
                  child: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 60,
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

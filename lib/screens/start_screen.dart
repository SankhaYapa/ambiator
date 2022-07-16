import 'package:ambiator/components/custom_text.dart';
import 'package:ambiator/screens/home_screen.dart';
import 'package:ambiator/screens/main_screen.dart';
import 'package:ambiator/utils/app_colors.dart';
import 'package:ambiator/utils/constant.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => MainScreen())));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeft(
              child: Container(
                child: Image.asset(
                  Constants.imageAssets(
                    'logo.jpeg',
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

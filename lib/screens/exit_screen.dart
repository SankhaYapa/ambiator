import 'dart:io';

import 'package:ambiator/components/custom_text.dart';
import 'package:ambiator/screens/home_screen.dart';
import 'package:ambiator/screens/main_screen.dart';
import 'package:ambiator/utils/app_colors.dart';
import 'package:ambiator/utils/constant.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExitScreen extends StatefulWidget {
  const ExitScreen({Key? key}) : super(key: key);

  @override
  State<ExitScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<ExitScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        onPressed:
        () {
          exit(0);
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kwhite,
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
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
              CustomText(text: 'www.ambiator.com'),
              CustomText(text: 'hi@ambiator.com'),
              SizedBox(
                height: 30,
              ),
              CustomText(text: 'The choice of sensible people'),
              SizedBox(
                height: 300,
              ),
              CustomText(text: 'Do you want to exit ?'),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HomeScreen()))),
                        child: CustomText(
                          text: 'No',
                          color: kwhite,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kpink,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => exit(0),
                        child: CustomText(
                          text: 'Yes',
                          color: kwhite,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kpink,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

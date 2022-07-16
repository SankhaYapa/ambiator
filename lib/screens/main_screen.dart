import 'package:ambiator/provider/bottom_nar_provider.dart';
import 'package:ambiator/provider/counter_provider.dart';
import 'package:ambiator/screens/dashboard_screen.dart';
import 'package:ambiator/screens/start_screen.dart';
import 'package:ambiator/utils/util_function.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../components/custom_text.dart';
import '../utils/app_colors.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // int _currentIndex = 0;
  List<Widget> _screens = [HomeScreen()];
  Future<bool> initBackButton() async {
    Logger().d('back button press');

    //when in home screen if you try to exit it shows dialog box
    return await showDialog(
          context: context,
          builder: (context) => ElasticIn(
            child: AlertDialog(
              title: CustomText(text: 'Exit App'),
              content: CustomText(text: 'Do you want to really exit an App'),
              actions: [
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: CustomText(text: 'No')),
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: CustomText(text: 'Yes'))
              ],
            ),
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: initBackButton,
        child: Consumer<BottomNavProvider>(
          builder: (context, value, child) {
            return Scaffold(
              body: _screens.elementAt(value.activeIndex),
              bottomNavigationBar: Container(
                color: kwhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavTile(
                      text: 'CALCULATE',
                      isSelected: value.activeIndex == 0,
                      ontap: () {
                        value.onItemTapped(0);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class BottomNavTile extends StatelessWidget {
  const BottomNavTile({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.ontap,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Container(
        width: size.width,
        height: 60,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected ? kpink : Colors.black12,
        ),
        child: CustomText(
          text: text,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
          color: isSelected ? kwhite : kblack,
          fontSize: 18,
        ),
      ),
    );
  }
}

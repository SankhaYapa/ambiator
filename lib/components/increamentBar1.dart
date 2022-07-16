import 'package:ambiator/components/custom_text.dart';
import 'package:ambiator/provider/counter_provider.dart';
import 'package:ambiator/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncrementBar1 extends StatelessWidget {
  const IncrementBar1({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(children: [
          Container(
            width: size.width - 20,
            height: 100,
            color: kwhite,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: CustomText(
                      text: 'Capacity TR',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<CounterProvider>(context, listen: false)
                              .decreaseCounter();

                          Provider.of<CounterProvider>(context, listen: false)
                              .setunits();

                          Provider.of<CounterProvider>(context, listen: false)
                              .count();

                          // setState(() {
                          //   counter--;
                          // });
                        },
                        child: Icon(Icons.remove),
                        style: ElevatedButton.styleFrom(
                          primary: kpink,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      Consumer<CounterProvider>(
                        builder: (context, value, child) {
                          return Column(
                            children: [
                              Text(""),
                              CustomText(
                                text: value.getCounter.toString(),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              (value.getIsError1)
                                  ? Text(
                                      value.getMessage1,
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : Text(""),
                            ],
                          );
                        },
                      ),

                      // Text(
                      //   'data',
                      //   style: TextStyle(
                      //       fontSize: 30, fontWeight: FontWeight.w500),
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<CounterProvider>(context, listen: false)
                              .increaseCounter();
                          Provider.of<CounterProvider>(context, listen: false)
                              .setunits();
                          Provider.of<CounterProvider>(context, listen: false)
                              .count();
                        },
                        child: Icon(Icons.add),
                        style: ElevatedButton.styleFrom(
                          primary: kpink,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ])
      ],
    );
  }
}

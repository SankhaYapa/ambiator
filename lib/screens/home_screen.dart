import 'package:ambiator/components/custom_text.dart';
import 'package:ambiator/provider/counter_provider.dart';
import 'package:ambiator/utils/app_colors.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: grayColor,
                  width: size.width,
                  height: size.height / 5,
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Stack(children: [
                    Container(
                      width: size.width - 20,
                      height: 100,
                      color: kwhite,
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Provider.of<CounterProvider>(context,
                                //         listen: false)
                                //     .decreaseCounter();
                                setState(() {
                                  counter--;
                                });
                              },
                              child: Icon(Icons.remove),
                              style: ElevatedButton.styleFrom(
                                primary: kpink,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                            CustomText(
                              text: '$counter',
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),

                            // Text(
                            //   'data',
                            //   style: TextStyle(
                            //       fontSize: 30, fontWeight: FontWeight.w500),
                            // ),
                            ElevatedButton(
                              onPressed: () {
                                // Provider.of<CounterProvider>(context,
                                //         listen: false)
                                //     .increaseCounter();
                                setState(() {
                                  counter++;
                                });
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
                      ),
                    )
                  ]),
                )
              ],
            ),
            DataTabel(
              count: counter.toString(),
            ),
          ],
        )),
      ),
    );
  }
}

class DataTabel extends StatelessWidget {
  const DataTabel({
    Key? key,
    required this.count,
  }) : super(key: key);
  final String count;
  @override
  Widget build(BuildContext context) {
    return DataTable(columns: [
      DataColumn(
          label: Text(
        'Description',
        style: TextStyle(fontSize: 16),
      )),
      DataColumn(
          label: Text(
        'Description',
        style: TextStyle(fontSize: 16),
      )),
      DataColumn(
          label: Text(
        'Ambiator',
        style: TextStyle(fontSize: 16),
      )),
      DataColumn(
          label: Text(
        'AC',
        style: TextStyle(fontSize: 16),
      )),
      DataColumn(
          label: Text(
        'AC',
        style: TextStyle(fontSize: 16),
      )),
    ], rows: [
      DataRow(cells: [
        DataCell(
          Text('Number of Units'),
        ),
        DataCell(
          Text('Nos'),
        ),
        DataCell(
          Text('$count'),
        ),
        DataCell(
          Text('16'),
        ),
        DataCell(
          Text('16'),
        ),
      ])
    ]);
  }
}

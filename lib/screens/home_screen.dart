import 'package:ambiator/components/custom_text.dart';
import 'package:ambiator/components/custome_textfield.dart';
import 'package:ambiator/components/table_details.dart';
import 'package:ambiator/provider/counter_provider.dart';
import 'package:ambiator/screens/dashboard_screen.dart';
import 'package:ambiator/utils/app_colors.dart';
import 'package:ambiator/utils/util_function.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String time = '?';
  int counter = 0;
  bool isVisible = true;
  bool errorText = false;
  late List<GDPData> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: size.height,
            child: Consumer<CounterProvider>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    IncrementBar(size: size),
                    Container(
                      // onDoubleTap: () {
                      //   UtilFunction.navigateTo(context, DashboardScreen());
                      // },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width / 1.5,
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Search',
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.filter_alt_sharp,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                      final now = DateTime.now();
                                      time = DateFormat('dd-MM-yy').format(now);
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Visibility(
                                        visible: isVisible,
                                        child: Container(
                                          child: Icon(
                                            Icons.dashboard,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: !isVisible,
                                        child: Container(
                                          child: Icon(
                                            Icons.table_chart,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Column(
                        children: [
                          TableHeadder(),
                          TableDetailsRow(
                            des: "Number of Units",
                            units: "kW",
                            amb: value.getNouAm.toString(),
                            ac: value.getNouAc.toString(),
                          ),
                          TableDetailsRow(
                            des: "Connected Power",
                            units: "Nos",
                            amb: value.getCpAm.toString(),
                            ac: value.getCpAc.toString(),
                          ),
                          TableDetailsRow(
                            des: "Absorbed Power",
                            units: "kW",
                            amb: value.getApAm.toString(),
                            ac: value.getApAc.toString(),
                          ),
                          TableDetailsRow(
                            des: "Water use(Avg)",
                            units: "Ltrs/Hr.",
                            amb: value.getWuAm.toString(),
                          ),
                          TableDetailsRow(
                            des: "Capial Cost",
                            units: "INR Lacs",
                            amb: value.getCcAm.toString(),
                            ac: value.getCcAc.toString(),
                          ),
                          TableDetailsRow(
                            des: "Power Tarrif",
                            units: "INR/kWh",
                            amb: value.getPtAm.toString(),
                            ac: value.getPtAc.toString(),
                          ),
                          TableDetailsRow(
                            des: "Cooling Season",
                            units: "Hours",
                            amb: value.getCsAm.toString(),
                            ac: value.getCsAc.toString(),
                          ),
                          TableDetailsRow(
                            des: "Oparating Cost/\nYear",
                            units: "INR Lacs",
                            amb: value.getOcAm.toString(),
                            ac: value.getOcAc.toString(),
                          ),
                          TableDetailsRow(
                            des: "CAPEX  Savings ",
                            units: "INR Lacs",
                            amb: value.getCSrving.toString(),
                            align3: TextAlign.right,
                          ),
                          TableDetailsRow(
                            des: "Annual OPEX Savings ",
                            units: "INR Lacs",
                            amb: value.getAOseving.toString(),
                            align3: TextAlign.right,
                          ),
                          TableDetailsRow(
                            des: "Total Savings",
                            units: "INR Lacs",
                            amb: value.getTServing.toString(),
                            align3: TextAlign.right,
                          ),
                        ],
                      ),
                    ),

                    // Visibility(
                    //   visible: isVisible,
                    //   child: DataTabel(
                    //     count: counter.toString(),
                    //   ),
                    // ),
                    Dashboard(
                      isVisible: isVisible,
                      size: size,
                      chartData: _chartData,
                      time: time,
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
    required this.isVisible,
    required this.size,
    required List<GDPData> chartData,
    required this.time,
  })  : _chartData = chartData,
        super(key: key);

  final bool isVisible;
  final Size size;
  final List<GDPData> _chartData;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Visibility(
          visible: !isVisible,
          child: Consumer<CounterProvider>(
            builder: (context, value, child) {
              return Container(
                  height: size.height,
                  color: dashback,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Records:11',
                              fontSize: 20,
                              color: kwhite,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: 'Last Update:',
                                  fontSize: 20,
                                  color: kwhite,
                                ),
                                CustomText(
                                  text: time,
                                  fontSize: 20,
                                  color: kwhite,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              color: boxcl,
                              height: 140,
                              width: 250,
                              child: Stack(children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.bar_chart,
                                        color: kwhite, size: 75),
                                    CustomText(
                                      text: 'Units',
                                      fontSize: 20,
                                      color: kwhite,
                                    ),
                                    CustomText(
                                      text: value.getNouAm.toString(),
                                      fontSize: 20,
                                      color: kwhite,
                                    )
                                  ],
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration:
                            BoxDecoration(border: Border.all(color: kwhite)),
                        alignment: Alignment.center,
                        width: size.width,
                        child: CustomText(
                          text: 'Count',
                          fontSize: 30,
                          color: kwhite,
                        ),
                      ),
                      Container(
                        height: size.width / 1.5,
                        width: size.width,
                        child: SfCartesianChart(
                          series: <ChartSeries>[
                            BarSeries<GDPData, String>(
                                color: kgreen,
                                dataSource: _chartData,
                                xValueMapper: (GDPData gdp, _) => gdp.continent,
                                yValueMapper: (GDPData gdp, _) => gdp.gdp,
                                dataLabelSettings: DataLabelSettings(
                                    isVisible: true,
                                    color: kpink,
                                    borderColor: kblack,
                                    borderWidth: 1,
                                    textStyle: TextStyle(fontSize: 20)))
                          ],
                          primaryXAxis: CategoryAxis(
                              labelStyle:
                                  TextStyle(fontSize: 15, color: kwhite)),
                          primaryYAxis: NumericAxis(
                              labelStyle:
                                  TextStyle(fontSize: 15, color: kwhite)),
                        ),
                      ),
                    ],
                  ));
            },
          )),
    );
  }
}

List<GDPData> getChartData() {
  final List<GDPData> chartData = [
    GDPData('Hours', CounterProvider().getCsAm),
    GDPData('INR Lacs', 8),
    GDPData('INR/Kwh', 1),
    GDPData('kW', 1),
    GDPData('Ltrs/Hr', 1),
    GDPData('Nos', 1),
  ];
  return chartData;
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}

class IncrementBar extends StatelessWidget {
  IncrementBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<CounterProvider>(context, listen: false)
                            .decreaseCounter();

                        Provider.of<CounterProvider>(context, listen: false)
                            .setunits();

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
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                            (value.getIsError)
                                ? Text(
                                    value.getMessage,
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
                        // setState(() {
                        //   counter++;
                        // });
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
    );
  }
}

// class DataTabel extends StatelessWidget {
//   const DataTabel({
//     Key? key,
//     required this.count,
//   }) : super(key: key);
//   final String count;
//   @override
//   Widget build(BuildContext context) {
//     return DataTable(columns: [
//       TableHeadder(),
//       DataColumn(
//           label: Text(
//         'Description',
//         style: TextStyle(fontSize: 16),
//       )),
//       DataColumn(
//           label: Text(
//         'Description',
//         style: TextStyle(fontSize: 16),
//       )),
//       DataColumn(
//           label: Text(
//         'Ambiator',
//         style: TextStyle(fontSize: 16),
//       )),
//       DataColumn(
//           label: Text(
//         'AC',
//         style: TextStyle(fontSize: 16),
//       )),
//       DataColumn(
//           label: Text(
//         'AC',
//         style: TextStyle(fontSize: 16),
//       )),
//     ], rows: [
//       DataRow(cells: [
//         DataCell(
//           Text('Number of Units'),
//         ),
//         DataCell(
//           Text('Nos'),
//         ),
//         DataCell(
//           Text('$count'),
//         ),
//         DataCell(
//           Text('16'),
//         ),
//         DataCell(
//           Text('16'),
//         ),
//       ])
//     ]);
//   }
// }

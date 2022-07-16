import 'dart:io';

import 'package:ambiator/components/custom_text.dart';
import 'package:ambiator/components/custome_textfield.dart';
import 'package:ambiator/components/increamentBar1.dart';
import 'package:ambiator/components/increamentBar2.dart';
import 'package:ambiator/components/increamentBar2.dart';
import 'package:ambiator/components/increamentBar3.dart';
import 'package:ambiator/components/table_details.dart';
import 'package:ambiator/provider/counter_provider.dart';
import 'package:ambiator/screens/dashboard_screen.dart';
import 'package:ambiator/screens/exit_screen.dart';
import 'package:ambiator/utils/app_colors.dart';
import 'package:ambiator/utils/util_function.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
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
  late List<GDPData> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    // TODO: implement initState
    super.initState();
  }

  String x = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(31, 62, 61, 61),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Consumer<CounterProvider>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 75,
                      ),
                      IncrementBar1(size: size),
                      SizedBox(
                        height: 10,
                      ),
                      IncrementBar2(size: size),
                      SizedBox(
                        height: 10,
                      ),
                      IncrementBar3(size: size),
                      Container(
                        // onDoubleTap: () {
                        //   UtilFunction.navigateTo(context, DashboardScreen());
                        // },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Container(
                              //   width: size.width / 1.5,
                              //   height: 50,
                              //   child: TextField(
                              //     decoration: InputDecoration(
                              //         hintText: 'Search',
                              //         filled: true,
                              //         fillColor: Colors.white,
                              //         enabledBorder: OutlineInputBorder(
                              //             borderSide:
                              //                 BorderSide(color: Colors.black12)),
                              //         focusedBorder: OutlineInputBorder(
                              //           borderRadius: BorderRadius.circular(10),
                              //         )),
                              //   ),
                              // ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                        final now = DateTime.now();
                                        time =
                                            DateFormat('dd-MM-yy').format(now);
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        // Visibility(
                                        //   visible: isVisible,
                                        //   child: Container(
                                        //     child: Icon(
                                        //       Icons.dashboard,
                                        //       size: 40,
                                        //     ),
                                        //   ),
                                        // ),
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
                      Container(
                        color: kwhite,
                        child: Visibility(
                          visible: isVisible,
                          child: Column(
                            children: [
                              TableHeadder(),
                              TableDetailsRow(
                                des: "Number of Units",
                                units: "Nos",
                                amb: value.getNouAm.toStringAsFixed(0),
                                ac: value.getNouAc.toStringAsFixed(0),
                              ),
                              Container(
                                color: Colors.black12,
                                child: TableDetailsRow(
                                  des: "Connected Power",
                                  units: "kW",
                                  amb: value.getCpAm.toStringAsFixed(1),
                                  ac: value.getCpAc.toStringAsFixed(1),
                                ),
                              ),
                              TableDetailsRow(
                                des: "Absorbed Power",
                                units: "kW",
                                amb: value.getApAm.toStringAsFixed(1),
                                ac: value.getApAc.toStringAsFixed(1),
                              ),
                              Container(
                                color: Colors.black12,
                                child: TableDetailsRow(
                                  des: "Water use(Avg)",
                                  units: "Ltrs/Hr.",
                                  amb: value.getWuAm.toStringAsFixed(0),
                                ),
                              ),
                              TableDetailsRow(
                                des: "Capial Cost",
                                units: "INR Lacs",
                                amb: value.getCcAm.toStringAsFixed(1),
                                ac: value.getCcAc.toStringAsFixed(1),
                              ),
                              // Container(
                              //   color: Colors.black12,
                              //   child: TableDetailsRow(
                              //     des: "Power Tarrif",
                              //     units: "INR/kWh",
                              //     amb: value.getPtAm.toStringAsFixed(1),
                              //     ac: value.getPtAc.toStringAsFixed(1),
                              //   ),
                              // ),
                              // TableDetailsRow(
                              //   des: "Cooling Season",
                              //   units: "Hours",
                              //   amb: value.getCsAm.toStringAsFixed(1),
                              //   ac: value.getCsAc.toStringAsFixed(1),
                              // ),
                              Container(
                                color: Colors.black12,
                                child: TableDetailsRow(
                                  des: "Oparating Cost/\nYear",
                                  units: "INR Lacs",
                                  amb: value.getOcAm.toStringAsFixed(2),
                                  ac: value.getOcAc.toStringAsFixed(2),
                                ),
                              ),
                              TableDetailsRow(
                                des: "CAPEX  Savings ",
                                units: "INR Lacs",
                                amb: value.getCSrving.toStringAsFixed(2),
                                align3: TextAlign.center,
                              ),
                              Container(
                                color: Colors.black12,
                                child: TableDetailsRow(
                                  des: "Annual OPEX Savings ",
                                  units: "INR Lacs",
                                  amb: value.getAOseving.toStringAsFixed(2),
                                  align3: TextAlign.center,
                                ),
                              ),
                              TableDetailsRow(
                                des: "Total Savings",
                                units: "INR Lacs",
                                amb: value.getTServing.toStringAsFixed(2),
                                align3: TextAlign.center,
                              ),
                            ],
                          ),
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
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ExitScreen())));
                    },
                    child: CustomText(
                      text: 'WoW Thanks',
                      fontSize: 20,
                      color: kwhite,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: kpink,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      // InkWell(
      //   onTap: () {},
      //   child: Container(
      //     width: size.width,
      //     height: 50,
      //     padding: EdgeInsets.all(15),
      //     decoration: BoxDecoration(
      //       color: kpink,
      //     ),
      //     child: CustomText(
      //       text: "CALCULATE",
      //       textAlign: TextAlign.center,
      //       fontWeight: FontWeight.w600,
      //       color: kwhite,
      //       fontSize: 18,
      //     ),
      //   ),
      // ),
    );
  }
}

class Dashboard extends StatefulWidget {
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
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: !widget.isVisible,
        child: Consumer<CounterProvider>(
          builder: (context, value, child) {
            return Container(
                color: dashback,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
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
                                text: widget.time,
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
                    Consumer<CounterProvider>(
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            RefreshProgressIndicator.defaultStrokeWidth;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: kwhite)),
                            alignment: Alignment.center,
                            width: widget.size.width,
                            child: CustomText(
                              text: 'Count',
                              fontSize: 30,
                              color: kwhite,
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Consumer(
                          builder: (context, value, child) {
                            return Container(
                              width: widget.size.width,
                              child: SfCartesianChart(
                                series: <ChartSeries>[
                                  BarSeries<GDPData, String>(
                                      color: kgreen,
                                      dataSource: widget._chartData,
                                      xValueMapper: (GDPData gdp, _) =>
                                          gdp.continent,
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
                            );
                          },
                        )),
                  ],
                ));
          },
        ));
  }
}

List<GDPData> getChartData() {
  final List<GDPData> chartData = [
    GDPData('Hours', CounterProvider().getCsAm),
    GDPData('INR Lacs', CounterProvider().getOcAm),
    GDPData('INR/Kwh', CounterProvider().getPtAm),
    GDPData('kW', CounterProvider().getApAm),
    GDPData('Ltrs/Hr', CounterProvider().getWuAm),
    GDPData('Nos', CounterProvider().getCpAm),
  ];
  return chartData;
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
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

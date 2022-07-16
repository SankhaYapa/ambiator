// import 'package:ambiator/components/custom_text.dart';
// import 'package:ambiator/components/custome_textfield.dart';
// import 'package:ambiator/components/increamentBar1.dart';
// import 'package:ambiator/components/increamentBar2.dart';
// import 'package:ambiator/components/increamentBar2.dart';
// import 'package:ambiator/components/increamentBar3.dart';
// import 'package:ambiator/components/table_details.dart';
// import 'package:ambiator/provider/counter_provider.dart';
// import 'package:ambiator/screens/dashboard_screen.dart';
// import 'package:ambiator/utils/app_colors.dart';
// import 'package:ambiator/utils/util_function.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:intl/intl.dart';
// import 'package:logger/logger.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({
//     Key? key,
//     required this.isVisible,
//     required this.size,
//     required List<GDPData> chartData,
//     required this.time,
//   })  : _chartData = chartData,
//         super(key: key);

//   final bool isVisible;
//   final Size size;
//   final List<GDPData> _chartData;
//   final String time;

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//         visible: !widget.isVisible,
//         child: Consumer<CounterProvider>(
//           builder: (context, value, child) {
//             return Container(
//                 color: dashback,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           CustomText(
//                             text: 'Records:11',
//                             fontSize: 20,
//                             color: kwhite,
//                           ),
//                           Row(
//                             children: [
//                               CustomText(
//                                 text: 'Last Update:',
//                                 fontSize: 20,
//                                 color: kwhite,
//                               ),
//                               CustomText(
//                                 text: widget.time,
//                                 fontSize: 20,
//                                 color: kwhite,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             alignment: Alignment.center,
//                             color: boxcl,
//                             height: 140,
//                             width: 250,
//                             child: Stack(children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.bar_chart,
//                                       color: kwhite, size: 75),
//                                   CustomText(
//                                     text: 'Units',
//                                     fontSize: 20,
//                                     color: kwhite,
//                                   ),
//                                   CustomText(
//                                     text: value.getNouAm.toString(),
//                                     fontSize: 20,
//                                     color: kwhite,
//                                   )
//                                 ],
//                               ),
//                             ]),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       decoration:
//                           BoxDecoration(border: Border.all(color: kwhite)),
//                       alignment: Alignment.center,
//                       width: widget.size.width,
//                       child: CustomText(
//                         text: 'Count',
//                         fontSize: 30,
//                         color: kwhite,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Container(
//                         width: widget.size.width,
//                         child: SfCartesianChart(
//                           series: <ChartSeries>[
//                             BarSeries<GDPData, String>(
//                                 color: kgreen,
//                                 dataSource: widget._chartData,
//                                 xValueMapper: (GDPData gdp, _) => gdp.continent,
//                                 yValueMapper: (GDPData gdp, _) => gdp.gdp,
//                                 dataLabelSettings: DataLabelSettings(
//                                     isVisible: true,
//                                     color: kpink,
//                                     borderColor: kblack,
//                                     borderWidth: 1,
//                                     textStyle: TextStyle(fontSize: 20)))
//                           ],
//                           primaryXAxis: CategoryAxis(
//                               labelStyle:
//                                   TextStyle(fontSize: 15, color: kwhite)),
//                           primaryYAxis: NumericAxis(
//                               labelStyle:
//                                   TextStyle(fontSize: 15, color: kwhite)),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ));
//           },
//         ));
//   }
// }

// List<GDPData> getChartData() {
//   final List<GDPData> chartData = [
//     GDPData('Hours', CounterProvider().getCsAm),
//     GDPData('INR Lacs', CounterProvider().getOcAm),
//     GDPData('INR/Kwh', CounterProvider().getPtAm),
//     GDPData('kW', CounterProvider().getApAm),
//     GDPData('Ltrs/Hr', CounterProvider().getWuAm),
//     GDPData('Nos', CounterProvider().getCpAm),
//   ];
//   return chartData;
// }

// class GDPData {
//   GDPData(this.continent, this.gdp);
//   final String continent;
//   final double gdp;
// }

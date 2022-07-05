import 'package:ambiator/components/custom_text.dart';
import 'package:ambiator/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
      body: Container(
        height: size.height,
        color: dashback,
        child: Stack(
          children: [
            Positioned(
              height: size.height / 2 - 200,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Records:11',
                    fontSize: 20,
                    color: kwhite,
                  ),
                  CustomText(
                    text: 'Last Update:04.07.2022',
                    fontSize: 20,
                    color: kwhite,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: size.height / 2,
              left: 20,
              child: Container(
                alignment: Alignment.center,
                color: boxcl,
                height: 200,
                width: 200,
                child: Stack(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.bar_chart, color: kwhite, size: 100),
                      CustomText(
                        text: 'Units',
                        fontSize: 30,
                        color: kwhite,
                      ),
                      CustomText(
                        text: '6',
                        fontSize: 30,
                        color: kwhite,
                      )
                    ],
                  ),
                ]),
              ),
            ),
            Positioned(
              bottom: size.height / 2.5,
              width: size.width,
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: kwhite)),
                alignment: Alignment.center,
                width: size.width,
                child: CustomText(
                  text: 'Count',
                  fontSize: 30,
                  color: kwhite,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
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
                      labelStyle: TextStyle(fontSize: 15, color: kwhite)),
                  primaryYAxis: NumericAxis(
                      labelStyle: TextStyle(fontSize: 15, color: kwhite)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<GDPData> getChartData() {
  final List<GDPData> chartData = [
    GDPData('Hours', 1),
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

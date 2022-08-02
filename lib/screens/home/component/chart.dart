import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class HomeChart extends StatefulWidget {
  const HomeChart({Key? key}) : super(key: key);

  @override
  State<HomeChart> createState() => _HomeChartState();
}

class _HomeChartState extends State<HomeChart> {
  List<_SalesData> data = [
    _SalesData('Jan', 0),
    _SalesData('Feb', 0),
    _SalesData('Mar', 0),
    _SalesData('Apr', 0),
    _SalesData('May', 0),
    _SalesData('June', 0),
    _SalesData('July', 0),
    _SalesData('August', 0),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 25),
      child: Center(
          child: SizedBox(

            child: Column(
              children: [
                SfCartesianChart(primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(
                      
                      text: 'Monthly Sales Overview', alignment: ChartAlignment.near, textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16)),
                    // Enable legend
                    //legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_SalesData, String>>[
                      LineSeries<_SalesData, String>(
                          dataSource: data,
                          xValueMapper: (_SalesData sales, _) => sales.year,
                          yValueMapper: (_SalesData sales, _) => sales.sales,
                         name: '',
                          // Enable data label
                          //dataLabelSettings: const DataLabelSettings(isVisible: true)
                      )
                    ]),

            // Expanded(
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       //Initialize the spark charts widget
            //       child: SfSparkLineChart.custom(
            //         //Enable the trackball
            //         trackball: const SparkChartTrackball(
            //             activationMode: SparkChartActivationMode.tap),
            //         //Enable marker
            //         marker: const SparkChartMarker(
            //             displayMode: SparkChartMarkerDisplayMode.all),
            //         //Enable data label
            //         labelDisplayMode: SparkChartLabelDisplayMode.all,
            //         xValueMapper: (int index) => data[index].year,
            //         yValueMapper: (int index) => data[index].sales,
            //         dataCount: 5,
            //       ),
            //     ),)
            ],
            ),
          )
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

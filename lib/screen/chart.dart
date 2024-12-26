import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Custom Line Chart'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Legend Section

            // Chart Section
            AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                LineChartData(
                  maxX: 6,
                  minX: 1,
                  minY: 0,
                  maxY: 4,
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 50,
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          switch (value.toInt()) {
                            case 4:
                              return const Text('Severe',
                                  style: TextStyle(fontSize: 12));
                            case 3:
                              return const Text('Moderate',
                                  style: TextStyle(fontSize: 12));
                            case 2:
                              return const Text('Mild',
                                  style: TextStyle(fontSize: 12));
                            case 1:
                              return const Text('Normal',
                                  style: TextStyle(fontSize: 12));
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          switch (value.toInt()) {
                            case 1:
                              return const Text('Jan',
                                  style: TextStyle(fontSize: 8));
                            case 2:
                              return const Text('Feb',
                                  style: TextStyle(fontSize: 8));
                            case 3:
                              return const Text('march',
                                  style: TextStyle(fontSize: 8));
                            case 4:
                              return const Text('Apr',
                                  style: TextStyle(fontSize: 8));
                            case 5:
                              return const Text('MAY',
                                  style: TextStyle(fontSize: 8));
                            case 6:
                              return const Text('Jun',
                                  style: TextStyle(fontSize: 8));

                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    // Blue Line
                    LineChartBarData(
                      spots: [
                        FlSpot(1, 2.5), // Normal
                        FlSpot(1.8, 2.3), // Normal
                        FlSpot(2.6, 2.4), // Normal
                        FlSpot(3.5, 2.7), // Normal
                        FlSpot(4.5, 3.5), // Normal
                        FlSpot(5.5, 3.5), // Normal
                        FlSpot(6, 2.7), // Normal
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                LineChartData(
                  maxX: 6,
                  minX: 1,
                  minY: 0,
                  maxY: 4,
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 50,
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          switch (value.toInt()) {
                            case 4:
                              return const Text('Sharp',
                                  style: TextStyle(fontSize: 12));
                            case 3:
                              return const Text('Perfect',
                                  style: TextStyle(fontSize: 12));
                            case 2:
                              return const Text('Acceptable',
                                  style: TextStyle(fontSize: 12));
                            case 1:
                              return const Text('need attention',
                                  style: TextStyle(fontSize: 12));
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          switch (value.toInt()) {
                            case 1:
                              return const Text('Jan',
                                  style: TextStyle(fontSize: 8));
                            case 2:
                              return const Text('Feb',
                                  style: TextStyle(fontSize: 8));
                            case 3:
                              return const Text('march',
                                  style: TextStyle(fontSize: 8));
                            case 4:
                              return const Text('Apr',
                                  style: TextStyle(fontSize: 8));
                            case 5:
                              return const Text('MAY',
                                  style: TextStyle(fontSize: 8));
                            case 6:
                              return const Text('Jun',
                                  style: TextStyle(fontSize: 8));

                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    // Blue Line
                    LineChartBarData(
                      spots: [
                        FlSpot(1, 2.5), // Normal
                        FlSpot(1.8, 2.3), // Normal
                        FlSpot(2.6, 2.4), // Normal
                        FlSpot(3.5, 2.7), // Normal
                        FlSpot(4.5, 3.5), // Normal
                        FlSpot(5.5, 3.5), // Normal
                        FlSpot(6, 2.7), // Normal
                      ],
                      isCurved: false,
                      color: Colors.blue,
                      dotData: FlDotData(show: true),
                      isStrokeCapRound: false,
                      barWidth: 0, // Set barWidth to 0 to hide the line
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(1.3, 1.1), // Normal
                        FlSpot(2.1, 3), // Normal
                      ],
                      isCurved: false,
                      color: Colors.red,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCrossPainter(
                          size: 8,
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      isStrokeCapRound: false,
                      barWidth: 0, // Set barWidth to 0 to hide the line
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

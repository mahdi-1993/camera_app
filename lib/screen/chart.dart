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
                  maxX: 10,
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
                              return const Text('18/Jan',
                                  style: TextStyle(fontSize: 8));
                            case 2:
                              return const Text('18/Feb',
                                  style: TextStyle(fontSize: 8));
                            case 3:
                              return const Text('18/march',
                                  style: TextStyle(fontSize: 8));
                            case 4:
                              return const Text('18/Apr',
                                  style: TextStyle(fontSize: 8));
                            case 5:
                              return const Text('16/Jun',
                                  style: TextStyle(fontSize: 8));
                            case 6:
                              return const Text('23/Jun',
                                  style: TextStyle(fontSize: 8));
                            case 7:
                              return const Text('10/Oct',
                                  style: TextStyle(fontSize: 8));
                            case 8:
                              return const Text('10/NOV',
                                  style: TextStyle(fontSize: 8));
                            case 9:
                              return const Text('10/DEC',
                                  style: TextStyle(fontSize: 8));
                            case 10:
                              return const Text('30/DEC',
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
        
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(2, 2), // Normal
                      ],
                      isCurved: true,
                      color: Colors.pink,
                      barWidth: 4,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                    // Pink Line
                    LineChartBarData(
                      spots: [
                        FlSpot(5, 2), // Mild
                        FlSpot(6, 1.7),
                        FlSpot(7, 1),
                        FlSpot(8, 2),
                        FlSpot(9, 0.5),
                        FlSpot(10, 1.3),
                      ],
                      isCurved: true,
                      color: Colors.pink,
                      barWidth: 4,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(7, 1.5), // Mild
                        FlSpot(8, 3),
                        FlSpot(10, 2),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(3, 1.1), // Mild
                        FlSpot(4, 0.8),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      dotData: FlDotData(show: false),
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

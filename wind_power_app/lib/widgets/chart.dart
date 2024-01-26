import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wind_power_app/view_models/chart_view_model.dart';

class Chart extends StatefulWidget {
  const Chart({super.key, this.model});

  final ChartViewModel? model;

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    // Customize your X axis titles by value
                    Widget text;
                    switch (value.toInt()) {
                      case 0:
                        text = Text('Jan');
                        break;
                      case 1:
                        text = Text('Feb');
                        break;
                      case 2:
                        text = Text('Mar');
                        break;
                      // ... more cases ...
                      default:
                        text = Text('');
                        break;
                    }
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 10.0, // Customize the space as needed
                      child: text,
                    );
                  },
                  reservedSize: 40,
                ),
              ),
              leftTitles: AxisTitles(
                // Y axis
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    final text = Text('${value.toInt()}');
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 8.0, // Customize the space as needed
                      child: text,
                    );
                  },
                  reservedSize: 40, // Customize the reserved size for titles
                ),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 1),
                  FlSpot(1, 3),
                  FlSpot(2, 10),
                  FlSpot(3, 7),
                  FlSpot(4, 12),
                  // Add more spots here
                ],
                isCurved: true,
                color: Colors.blue,
                barWidth: 4,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

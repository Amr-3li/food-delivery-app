import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ShowLineChart extends StatelessWidget {
  const ShowLineChart({
    super.key,
    required String selectedPeriod,
    required Map<String, List<FlSpot>> chartData,
  }) : _selectedPeriod = selectedPeriod,
       _chartData = chartData;

  final String _selectedPeriod;
  final Map<String, List<FlSpot>> _chartData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (LineBarSpot spot) => Colors.black,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  return LineTooltipItem(
                    "\$${spot.y.toInt()}",
                    const TextStyle(color: Colors.white),
                  );
                }).toList();
              },
            ),
            touchCallback: (event, response) {},
          ),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: _selectedPeriod == 'Yearly' ? 1500 : 800, // Adjust scale
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  const labels = [
                    "10AM",
                    "11AM",
                    "12PM",
                    "01PM",
                    "02PM",
                    "03PM",
                    "04PM",
                  ];
                  if (value.toInt() >= 0 && value.toInt() < labels.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        labels[value.toInt()],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: _chartData[_selectedPeriod]!, // Dynamic data
              isCurved: true,
              color: Colors.orange,
              barWidth: 3,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 3,
                    color: Colors.orange,
                    strokeWidth: 0,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.orange.withAlpha(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

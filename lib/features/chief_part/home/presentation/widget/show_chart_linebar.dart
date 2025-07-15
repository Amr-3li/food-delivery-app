import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ShowLineChart extends StatelessWidget {
  const ShowLineChart({
    super.key,
    required List<FlSpot> spots,
    required List<String> timeLabels,
    required double maxY,
  }) : _spots = spots,
       _timeLabels = timeLabels,
       _maxY = maxY;

  final List<FlSpot> _spots;
  final List<String> _timeLabels;
  final double _maxY;

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
                    "\$${spot.y.toStringAsFixed(2)}",
                    const TextStyle(color: Colors.white),
                  );
                }).toList();
              },
            ),
            touchCallback: (event, response) {},
          ),
          minX: 0,
          maxX: _spots.length > 1 ? _spots.length - 1.toDouble() : 1,
          minY: 0,
          maxY: _maxY,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  if (value.toInt() >= 0 &&
                      value.toInt() < _timeLabels.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _timeLabels[value.toInt()],
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
              spots: _spots,
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

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/show_chart_linebar.dart';

class RevenueDashboard extends StatefulWidget {
  const RevenueDashboard({super.key});

  @override
  State<RevenueDashboard> createState() => _RevenueDashboardState();
}

class _RevenueDashboardState extends State<RevenueDashboard> {
  String _selectedPeriod = 'Daily'; // Default selection
  final List<String> _periods = ['Daily', 'Weekly', 'Monthly', 'Yearly'];

  // Mock data for different time periods (replace with your actual data)
  final Map<String, List<FlSpot>> _chartData = {
    'Daily': const [
      FlSpot(0, 200),
      FlSpot(1, 300),
      FlSpot(2, 500),
      FlSpot(3, 400),
      FlSpot(4, 350),
      FlSpot(5, 250),
      FlSpot(6, 100),
    ],
    'Weekly': const [
      FlSpot(0, 100),
      FlSpot(1, 400),
      FlSpot(2, 600),
      FlSpot(3, 300),
      FlSpot(4, 700),
      FlSpot(5, 500),
      FlSpot(6, 200),
    ],
    'Monthly': const [
      FlSpot(0, 300),
      FlSpot(1, 600),
      FlSpot(2, 400),
      FlSpot(3, 800),
      FlSpot(4, 500),
      FlSpot(5, 900),
      FlSpot(6, 700),
    ],
    'Yearly': const [
      FlSpot(0, 500),
      FlSpot(1, 800),
      FlSpot(2, 600),
      FlSpot(3, 1000),
      FlSpot(4, 700),
      FlSpot(5, 1200),
      FlSpot(6, 900),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Revenue",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "\$2,241",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                DropdownButton<String>(
                  value: _selectedPeriod,
                  underline: Container(),
                  items: _periods.map((String period) {
                    return DropdownMenuItem<String>(
                      value: period,
                      child: Row(
                        children: [
                          Text(period),
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedPeriod = newValue!;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            // "See Details" Link
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "See Details",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            const SizedBox(height: 16),

            ShowLineChart(
              selectedPeriod: _selectedPeriod,
              chartData: _chartData,
            ),
          ],
        ),
      ),
    );
  }
}

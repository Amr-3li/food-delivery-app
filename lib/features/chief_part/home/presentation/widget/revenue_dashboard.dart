import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chief_part/home/presentation/cubit/chef_statistics/chef_statistics_cubit.dart';
import 'package:restaurant/features/chief_part/home/presentation/cubit/chef_statistics/chef_statistics_state.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/show_chart_linebar.dart';

class RevenueDashboard extends StatefulWidget {
  const RevenueDashboard({super.key});

  @override
  State<RevenueDashboard> createState() => _RevenueDashboardState();
}

class _RevenueDashboardState extends State<RevenueDashboard> {
  String _selectedPeriod = 'today';
  final List<String> _periods = ['today', 'last_month', 'last_year'];

  @override
  void initState() {
    super.initState();
    context.read<ChefStatisticsCubit>().fetchInitialData(
      period: _selectedPeriod,
    );
  }

  List<FlSpot> _convertRevenueData(List<dynamic>? revenueDetails) {
    if (revenueDetails == null || revenueDetails.isEmpty) {
      return [FlSpot(0, 0)];
    }
    final limitedDetails = revenueDetails.length > 6
        ? revenueDetails.sublist(revenueDetails.length - 6)
        : revenueDetails;

    return limitedDetails.asMap().entries.map((entry) {
      final index = entry.key;
      final detail = entry.value;
      return FlSpot(
        index.toDouble(),
        double.tryParse(detail['revenue']?.toString() ?? '0') ?? 0,
      );
    }).toList();
  }

  List<String> _getTimeLabels(List<dynamic>? revenueDetails) {
    if (revenueDetails == null || revenueDetails.isEmpty) {
      return ['', '', '', '', '', ''];
    }

    final limitedDetails = revenueDetails.length > 6
        ? revenueDetails.sublist(revenueDetails.length - 6)
        : revenueDetails;

    return limitedDetails
        .map((detail) => detail['time']?.toString() ?? '')
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChefStatisticsCubit, ChefStatisticsState>(
      builder: (context, state) {
        final revenueDetails = state is ChefStatisticsLoaded
            ? state.statistics.revenueDetails
            : null;
        final spots = _convertRevenueData(revenueDetails);
        final timeLabels = _getTimeLabels(revenueDetails);
        final maxY = spots.isNotEmpty
            ? spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b) * 1.2
            : 1000;

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
                        Text(
                          state is ChefStatisticsLoaded
                              ? "\$${state.statistics.revenue.toStringAsFixed(2)}"
                              : "\$0.00",
                          style: const TextStyle(
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
                              Text(
                                _selectedPeriod == period
                                    ? '• $period'
                                    : period,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedPeriod = newValue;
                          });
                          context.read<ChefStatisticsCubit>().refreshData(
                            period: newValue,
                          );
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ShowLineChart(
                  spots: spots,
                  timeLabels: timeLabels,
                  maxY: maxY.toDouble(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChefStatistics {
  final String period;
  final int totalOrders;
  final int runningOrders;
  final int pendingOrders;
  final int completedOrders;
  final int cancelledOrders;
  final double revenue;
  final List<Map<String, dynamic>> revenueDetails;

  ChefStatistics({
    required this.period,
    required this.totalOrders,
    required this.runningOrders,
    required this.pendingOrders,
    required this.completedOrders,
    required this.cancelledOrders,
    required this.revenue,
    required this.revenueDetails,
  });

  factory ChefStatistics.fromJson(Map<String, dynamic> json) {
    return ChefStatistics(
      period: json['period'],
      totalOrders: json['total_orders'] ?? 0,
      runningOrders: json['running_orders'] ?? 0,
      pendingOrders: json['pending_orders'] ?? 0,
      completedOrders: json['completed_orders'] ?? 0,
      cancelledOrders: json['cancelled_orders'] ?? 0,
      revenue: double.tryParse(json['revenue']?.toString() ?? '0') ?? 0,
      revenueDetails: List<Map<String, dynamic>>.from(
        json['revenue_details'] ?? [],
      ),
    );
  }
}

// lib/features/chief_part/home/data/models/running_order_model.dart
class RunningOrder {
  final int id;
  final String status;
  final double total;
  final List<OrderItem> items;
  final DateTime createdAt;

  RunningOrder({
    required this.id,
    required this.status,
    required this.total,
    required this.items,
    required this.createdAt,
  });

  factory RunningOrder.fromJson(Map<String, dynamic> json) {
    return RunningOrder(
      id: json['id'],
      status: json['status'],
      total: double.tryParse(json['total'].toString()) ?? 0,
      items: (json['order_items'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

class OrderItem {
  final int id;
  final String dishName;
  final String sizeName;
  final int quantity;
  final double unitPrice;
  final Dish dish;

  OrderItem({
    required this.id,
    required this.dishName,
    required this.sizeName,
    required this.quantity,
    required this.unitPrice,
    required this.dish,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      dishName: json['dish_name'],
      sizeName: json['size_name'],
      quantity: json['quantity'],
      unitPrice: double.tryParse(json['unit_price'].toString()) ?? 0,
      dish: Dish.fromJson(json['dish']),
    );
  }
}

class Dish {
  final int id;
  final String name;
  final String description;
  final String image;
  final double avgRate;

  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.avgRate,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      avgRate: double.tryParse(json['avg_rate'].toString()) ?? 0,
    );
  }
}

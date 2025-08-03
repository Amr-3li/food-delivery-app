class MyOrdersModel {
  MyOrdersModel({
    required this.status,
    required this.message,
    required this.empty,
    required this.pagination,
  });

  final bool? status;
  final int? message;
  final List<Empty> empty;
  final Pagination? pagination;

  factory MyOrdersModel.fromJson(Map<String, dynamic> json){
    return MyOrdersModel(
      status: json["status"],
      message: json["message"],
      empty: json["تم جلب طلبات المستخدم بنجاح"] == null ? [] : List<Empty>.from(json["تم جلب طلبات المستخدم بنجاح"]!.map((x) => Empty.fromJson(x))),
      pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );
  }

}

class Empty {
  Empty({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.orderNumber,
    required this.items,
  });

  final int? id;
  final String? status;
  final String? totalPrice;
  final String? orderNumber;
  final List<Item> items;

  factory Empty.fromJson(Map<String, dynamic> json){
    return Empty(
      id: json["id"],
      status: json["status"],
      totalPrice: json["total_price"],
      orderNumber: json["order_number"],
      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );
  }

}

class Item {
  Item({
    required this.id,
    required this.dishName,
    required this.dishImage,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    required this.order,
  });

  final int? id;
  final String? dishName;
  final String? dishImage;
  final int? quantity;
  final String? unitPrice;
  final String? totalPrice;
  final Order? order;

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      id: json["id"],
      dishName: json["dish_name"],
      dishImage: json["dish_image"],
      quantity: json["quantity"],
      unitPrice: json["unit_price"],
      totalPrice: json["total_price"],
      order: json["order"] == null ? null : Order.fromJson(json["order"]),
    );
  }

}

class Order {
  Order({
    required this.orderId,
    required this.orderNumber,
    required this.orderStatus,
    required this.updatedAt,
  });

  final int? orderId;
  final String? orderNumber;
  final String? orderStatus;
  final DateTime? updatedAt;

  factory Order.fromJson(Map<String, dynamic> json){
    return Order(
      orderId: json["order_id"],
      orderNumber: json["order_number"],
      orderStatus: json["order_status"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}

class Pagination {
  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.first,
    required this.last,
    required this.nextPageUrl,
    required this.prevPageUrl,
  });

  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? totalPages;
  final int? first;
  final int? last;
  final dynamic nextPageUrl;
  final dynamic prevPageUrl;

  factory Pagination.fromJson(Map<String, dynamic> json){
    return Pagination(
      total: json["total"],
      count: json["count"],
      perPage: json["per_page"],
      currentPage: json["current_page"],
      totalPages: json["total_pages"],
      first: json["first"],
      last: json["last"],
      nextPageUrl: json["next_page_url"],
      prevPageUrl: json["prev_page_url"],
    );
  }

}

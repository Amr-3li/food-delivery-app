class CartModel {
  CartModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory CartModel.fromJson(Map<String, dynamic> json){
    return CartModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.cart,
    required this.total,
  });

  final Cart? cart;
  final double? total;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      cart: json["cart"] == null ? null : Cart.fromJson(json["cart"]),
      total: json["total"].toDouble() ?? 0.0,
    );
  }

}

class Cart {
  Cart({
    required this.id,
    required this.customerId,
    required this.couponId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });

  final int? id;
  final int? customerId;
  final dynamic couponId;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Item> items;

  factory Cart.fromJson(Map<String, dynamic> json){
    return Cart(
      id: json["id"],
      customerId: json["customer_id"],
      couponId: json["coupon_id"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );
  }

}

class Item {
  Item({
    required this.id,
    required this.cartId,
    required this.dishId,
    required this.sizeId,
    required this.quantity,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.dish,
    required this.size,
  });

  final int? id;
  final int? cartId;
  final int? dishId;
  final int? sizeId;
  final int? quantity;
  final String? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Dish? dish;
  final Size? size;

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      id: json["id"],
      cartId: json["cart_id"],
      dishId: json["dish_id"],
      sizeId: json["size_id"],
      quantity: json["quantity"],
      price: json["price"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      dish: json["dish"] == null ? null : Dish.fromJson(json["dish"]),
      size: json["size"] == null ? null : Size.fromJson(json["size"]),
    );
  }

}

class Dish {
  Dish({
    required this.id,
    required this.chefId,
    required this.name,
    required this.description,
    required this.image,
    required this.isAvailable,
    required this.totalRate,
    required this.avgRate,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? chefId;
  final String? name;
  final String? description;
  final String? image;
  final bool? isAvailable;
  final dynamic totalRate;
  final String? avgRate;
  final int? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Dish.fromJson(Map<String, dynamic> json){
    return Dish(
      id: json["id"],
      chefId: json["chef_id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      isAvailable: json["is_available"],
      totalRate: json["total_rate"],
      avgRate: json["avg_rate"],
      categoryId: json["category_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}

class Size {
  Size({
    required this.id,
    required this.dishId,
    required this.size,
    required this.price,
  });

  final int? id;
  final int? dishId;
  final String? size;
  final String? price;

  factory Size.fromJson(Map<String, dynamic> json){
    return Size(
      id: json["id"],
      dishId: json["dish_id"],
      size: json["size"],
      price: json["price"],
    );
  }
}

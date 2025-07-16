class CartModel {
  final int id;
  final int customerId;
  final String status;
  final List<CartItemModel> items;
  final double total;

  CartModel({
    required this.id,
    required this.customerId,
    required this.status,
    required this.items,
    required this.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final cart = data['cart'];

    return CartModel(
      id: cart['id'],
      customerId: cart['customer_id'],
      status: cart['status'],
      items: (cart['items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
      total: double.parse(data['total'].toString()),
    );
  }
}

class CartItemModel {
  final int id;
  final int cartId;
  final int dishId;
  final int sizeId;
  final int quantity;
  final double price;
  final DishModel dish;
  final DishSizeModel size;

  CartItemModel({
    required this.id,
    required this.cartId,
    required this.dishId,
    required this.sizeId,
    required this.quantity,
    required this.price,
    required this.dish,
    required this.size,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      cartId: json['cart_id'],
      dishId: json['dish_id'],
      sizeId: json['size_id'],
      quantity: json['quantity'],
      price: double.parse(json['price'].toString()),
      dish: DishModel.fromJson(json['dish']),
      size: DishSizeModel.fromJson(json['size']),
    );
  }
}

class DishModel {
  final int id;
  final int chefId;
  final String name;
  final String description;
  final String image;
  final bool isAvailable;
  final int totalRate;
  final String avgRate;
  final int categoryId;

  DishModel({
    required this.id,
    required this.chefId,
    required this.name,
    required this.description,
    required this.image,
    required this.isAvailable,
    required this.totalRate,
    required this.avgRate,
    required this.categoryId,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) {
    return DishModel(
      id: json['id'],
      chefId: json['chef_id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      isAvailable: json['is_available'],
      totalRate: json['total_rate'],
      avgRate: json['avg_rate'],
      categoryId: json['category_id'],
    );
  }
}

class DishSizeModel {
  final int id;
  final int dishId;
  final String size;
  final double price;

  DishSizeModel({
    required this.id,
    required this.dishId,
    required this.size,
    required this.price,
  });

  factory DishSizeModel.fromJson(Map<String, dynamic> json) {
    return DishSizeModel(
      id: json['id'],
      dishId: json['dish_id'],
      size: json['size'],
      price: double.parse(json['price'].toString()),
    );
  }
}

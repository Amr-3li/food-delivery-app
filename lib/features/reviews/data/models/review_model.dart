class ReviewModel {
  final int id;
  final int customerId;
  final int chefId;
  final int dishId;
  final int rating;
  final String comment;
  final DateTime createdAt;
  final Customer customer;
  final Chef chef;

  ReviewModel({
    required this.id,
    required this.customerId,
    required this.chefId,
    required this.dishId,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.customer,
    required this.chef,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      customerId: json['customer_id'],
      chefId: json['chef_id'],
      dishId: json['dish_id'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['created_at']),
      customer: Customer.fromJson(json['customer']),
      chef: Chef.fromJson(json['chef']),
    );
  }
}

class Customer {
  final int id;
  final String name;
  final String profileImage;

  Customer({required this.id, required this.name, required this.profileImage});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      profileImage: json['profile_image'],
    );
  }
}

class Chef {
  final int id;
  final String name;

  Chef({required this.id, required this.name});

  factory Chef.fromJson(Map<String, dynamic> json) {
    return Chef(id: json['id'], name: json['name']);
  }
}

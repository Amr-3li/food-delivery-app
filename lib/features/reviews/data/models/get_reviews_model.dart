class GetReviewsModel {
  GetReviewsModel({
    required this.data,
    required this.message,
  });

  final Data? data;
  final String? message;

  factory GetReviewsModel.fromJson(Map<String, dynamic> json){
    return GetReviewsModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
    );
  }

}

class Data {
  Data({
    required this.reviews,
    required this.averageRating,
    required this.totalReviews,
  });

  final Reviews? reviews;
  final int? averageRating;
  final int? totalReviews;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      reviews: json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
      averageRating: json["average_rating"],
      totalReviews: json["total_reviews"],
    );
  }

}

class Reviews {
  Reviews({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  final int? currentPage;
  final List<Datum> data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link> links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  factory Reviews.fromJson(Map<String, dynamic> json){
    return Reviews(
      currentPage: json["current_page"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      firstPageUrl: json["first_page_url"],
      from: json["from"],
      lastPage: json["last_page"],
      lastPageUrl: json["last_page_url"],
      links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
      nextPageUrl: json["next_page_url"],
      path: json["path"],
      perPage: json["per_page"],
      prevPageUrl: json["prev_page_url"],
      to: json["to"],
      total: json["total"],
    );
  }

}

class Datum {
  Datum({
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

  final int? id;
  final int? customerId;
  final int? chefId;
  final int? dishId;
  final dynamic rating;
  final String? comment;
  final DateTime? createdAt;
  final Customer? customer;
  final Chef? chef;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      customerId: json["customer_id"],
      chefId: json["chef_id"],
      dishId: json["dish_id"],
      rating: json["rating"],
      comment: json["comment"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
      chef: json["chef"] == null ? null : Chef.fromJson(json["chef"]),
    );
  }

}

class Chef {
  Chef({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory Chef.fromJson(Map<String, dynamic> json){
    return Chef(
      id: json["id"],
      name: json["name"],
    );
  }

}

class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.profileImage,
  });

  final int? id;
  final String? name;
  final dynamic profileImage;

  factory Customer.fromJson(Map<String, dynamic> json){
    return Customer(
      id: json["id"],
      name: json["name"],
      profileImage: json["profile_image"],
    );
  }

}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  final String? url;
  final String? label;
  final bool? active;

  factory Link.fromJson(Map<String, dynamic> json){
    return Link(
      url: json["url"],
      label: json["label"],
      active: json["active"],
    );
  }

}

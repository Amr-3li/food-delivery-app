class SearchModel {
	SearchModel({
		required this.dishId,
		required this.dishName,
		required this.dishImage,
		required this.size,
		required this.dishPrice,
		required this.categoryName,
	});

	final int? dishId;
	final String? dishName;
	final String? dishImage;
	final String? size;
	final String? dishPrice;
	final String? categoryName;

	factory SearchModel.fromJson(Map<String, dynamic> json){
		return SearchModel(
			dishId: json["dish_id"],
			dishName: json["dish_name"].toString(),
			dishImage: json["dish_image"].toString(),
			size: json["size"].toString(),
			dishPrice: json["dish_price"].toString(),
			categoryName: json["category_name"].toString(),
		);
	}

}

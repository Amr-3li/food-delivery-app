class SearchModel {
	String? dishName;
	String? dishImage;
	String? dishPrice;
	String? chefName;
	int? dishTotalRate;

	SearchModel({
		this.dishName, 
		this.dishImage, 
		this.dishPrice, 
		this.chefName, 
		this.dishTotalRate, 
	});

	factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
				dishName: json['dish_name'] as String?,
				dishImage: json['dish_image'] as String?,
				dishPrice: json['dish_price'] as String?,
				chefName: json['chef_name'] as String?,
				dishTotalRate: json['dish_total_rate'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'dish_name': dishName,
				'dish_image': dishImage,
				'dish_price': dishPrice,
				'chef_name': chefName,
				'dish_total_rate': dishTotalRate,
			};
}

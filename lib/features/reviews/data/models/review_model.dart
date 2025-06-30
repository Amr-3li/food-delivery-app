class ReviewModel {
  final String userName;
  final String userImage;
  final String reviewTtitle;
  final String reviewText;
  final int rating;
  final DateTime date;

  ReviewModel({
    required this.userName,
    required this.userImage,
    required this.reviewText,
    required this.reviewTtitle,
    required this.rating,
    required this.date,
  });

  // factory ReviewModel.fromJson(Map<String, dynamic> json) {
  //   return ReviewModel(
  //     userName: json['userName'],
  //     userImage: json['userImage'],
  //     reviewText: json['reviewText'],
  //     rating: (json['rating'] as num).toDouble(),
  //     date: DateTime.parse(json['date']),
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'userName': userName,
  //     'userImage': userImage,
  //     'reviewText': reviewText,
  //     'rating': rating,
  //     'date': date.toIso8601String(),
  //   };
  // }
}

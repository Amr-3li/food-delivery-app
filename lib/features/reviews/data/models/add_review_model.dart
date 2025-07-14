class AddReviewRequest {
  final int dishId;
  final int rating;
  final String comment;

  AddReviewRequest({
    required this.dishId,
    required this.rating,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {"dish_id": dishId, "rating": rating, "comment": comment};
  }
}

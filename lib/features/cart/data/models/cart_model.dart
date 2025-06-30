class CartItemModel {
  final int id;
  final String title;

  final String imageUrl;
  final double price;

  int quantity;
  CartItemModel({
    required this.id,
    required this.imageUrl,
    required this.price,
    required this.title,
    this.quantity = 1,
  });
}

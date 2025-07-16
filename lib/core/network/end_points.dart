abstract class EndPoints {
  static const String baseUrl =
      'https://round41-mobile-food.digital-vision-solutions.com/api/';
  static const String register = 'register';
  static const String login = 'login';
  static const String logout = 'logout';
  static const String recommendedCombo = 'categories/4/products/';
  static const String cart = 'cart';
  static const String productDetails = 'products/';
  static const String favorites = 'favourites';
  static String categoryProducts(int categoryId) =>
      'categories/$categoryId/products/';
  static String searchProducts(String query) => '/products?search=$query';
  static const String payment = 'payment';
  static const String resetPassword = "password/reset";
  static const String sendOtp = "password/send_otp";
  static const String chefStatistics = '${baseUrl}chef/statistics';
  static const String chefOrdersRunning = '${baseUrl}chef/orders/running';
  static String updateOrderStatus(int orderId, String status) =>
      '${baseUrl}chef/orders/$orderId/$status';
  static const String meals = '${baseUrl}meals';
  static const String address = "address";
  static const String verifyEmail = "email/verify";
  static const String searchPage = "client/meals_filter?";
}

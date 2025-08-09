abstract class EndPoints {
  static const String baseUrl =
      'https://round41-mobile-food.digital-vision-solutions.com/api/';
  static const String register = 'register';
  static const String login = 'login';
  static const String logout = 'logout';
  static const String recommendedCombo = 'categories/4/products/';
  static const String cart = 'cart';
  static const String productDetails = 'products/';
  static String categoryProducts(int categoryId) =>
      'categories/$categoryId/products/';
  static String searchProducts(String query) => '/products?search=$query';
  static const String payment = 'payment';
  static const String resetPassword = "password/reset";
  static const String sendOtp = "password/send_otp";
  static const String chefStatistics = 'chef/statistics';
  static const String chefOrdersRunning = 'chef/orders/running';
  static String updateOrderStatus(int orderId, String status) =>
      'chef/orders/$orderId/$status';
  static String filterSearch(int rate, int price) =>
      'client/meals_filter?rate=$rate&price=$price';
  static const String meals = 'meals';
  static const String address = "address";
  static String chifReviews(int chifReview) =>
      '${baseUrl}chefs/$chifReview/reviews/';
  static const String getAddress = "my/addresses";
  static const String profile = "profile";
  static const String updateProfile = "update/user";
  static const String verifyEmail = "email/verify";
  static const String searchPage = "client/meals_search?search=";
  static const String categories = "categories";
  static const String mealsType = "dishes/meal-type";
  static const String mealDetails = "client/meals";
  static const String suggestedResturants = "suggestedResturants";
  static const String popularMeals = "popualarMeals";
  static const String addToFavorites = "favorites/add";
  static const String removeFromFavorites = "favorites/remove";
  static const String getFavorites = "favorites";
  static const String getRestaurants = "open-resturants";
  static const String getRestaurantDetails = "resturants";
  static const String getMyOrders = "get/customer/orders/where?";
  static const String changeOrderStatus = "change/order/status";
  static const String getDefaultAddress = "default/address";
  static const String notifications = "notifications";
  static const String reviews = "reviews";
  static const String myReviews = "user/get/reviews";
}

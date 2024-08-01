// ignore_for_file: constant_identifier_names

class AppConstants{
  static const String APP_NAME = "DBShop";
  static const int APP_VERSION = 1;
  
  //static const String BASE_URL = "http://127.0.0.1:8000";
  //static const String BASE_URL = "https://127.0.0.1:8000";
  //static const String BASE_URL = "https://10.0.2.2:8000";
  static const String BASE_URL = "http://mvs.bslmeiyu.com";

  // End point
  static const String POPULAR_PRODUCT_URI = "/api/v1/products/popular/";
  static const String RECOMMENDED_PRODUCT_URI = "/api/v1/products/recommended";
  static const String UPLOAD_URI = "/uploads/";

  // Token
  static const String TOKEN = "DBtoken";
}
import 'package:movie_zone/core/constans/app_urls.dart';

class ImageDisplayHelper {
   static String generateProductImageURL(String title) {
    return AppUrls.productImage + title +  AppUrls.alt;
  }
}
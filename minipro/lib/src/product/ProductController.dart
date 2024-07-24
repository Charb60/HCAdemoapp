import 'package:get/get.dart';
import 'package:dio/dio.dart';

class ProductController extends GetxController {
  var products = [].obs;
  final Dio _dio = Dio();

  Future<void> fetchProducts() async {
    try {
      final response = await _dio.get(
        "http://10.0.2.2:8080/api/v1/products",
        options: Options(responseType: ResponseType.json),
      );
      products.value = response.data;
    } catch (e) {
      print("Error fetching products: $e");
    }
  }
}

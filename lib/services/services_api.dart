import 'package:http/http.dart' as http;
import 'package:storewithgetx/app/models/product_model.dart';

class ServicesApi {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(
      'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
      headers: {"Content-Type": "application/json; charset=utf-8"},
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }
}

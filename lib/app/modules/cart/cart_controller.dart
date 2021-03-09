import 'package:get/get.dart';
import 'package:storewithgetx/app/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = List<Product>().obs;
  int get count => cartItems.length;
  double get totalPreice =>
      cartItems.fold(0, (sum, item) => sum + double.parse(item.price));

  addToCart(Product product) {
    cartItems.add(product);
  }
}

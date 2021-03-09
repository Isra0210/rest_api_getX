import 'package:get/get.dart';
import 'package:storewithgetx/app/models/product_model.dart';
import 'package:storewithgetx/services/services_api.dart';

class Controller extends GetxController {
  RxBool isLoading = true.obs;
  get isLoadingRx => isLoading.value;
  List<Product> productList = List<Product>().obs;
  List<Product> productListFavorite = List<Product>().obs;

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ServicesApi.fetchProducts();

      if (products != null) {
        productList = products;
      }
    } catch (error) {
      printError(info: error);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
}

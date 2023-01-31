import 'package:apitest/services/api_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs;
  var productsList = [].obs;

  @override
  void onInit() {

    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiServices().fetchProducts();
      if (products != null) {
        productsList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}

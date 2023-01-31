import 'package:apitest/models/products_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<ProductsModel>?> fetchProducts() async {
    var response =
        await http.get(Uri.parse("http://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      var data = response.body;
      return productsModelFromJson(data);
    } else {
      print("No data");
    }
  }
}

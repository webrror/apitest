import 'package:apitest/controllers/products_controller.dart';
import 'package:apitest/widgets/productCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return MasonryGridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.only(left: 8, right: 8,top: 10, bottom: 50),
            itemCount: productController.productsList.length,
            itemBuilder: (context, index) {
              return ProductCard(product: productController.productsList[index],);
            },
          );
        }
      }),
    );
  }
}

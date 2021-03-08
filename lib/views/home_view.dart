import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storewithgetx/controller/product_controller.dart';
import 'package:storewithgetx/views/favorite_view.dart';
import 'package:storewithgetx/widget/grid_widget.dart';

class HomeView extends GetView {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Your Store",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () => Get.to(
                () => FavoriteView(
                  productList: productController.productListFavorite,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Obx(() {
                if (productController.isLoadingRx) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.black),
                    ),
                  );
                } else {
                  return GridWidget(productList: productController.productList);
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}

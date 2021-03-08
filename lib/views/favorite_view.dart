import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:storewithgetx/controller/product_controller.dart';
import 'package:storewithgetx/models/product.dart';
import 'package:storewithgetx/widget/grid_widget.dart';

class FavoriteView extends GetView<ProductController> {
  final List<Product> productList;

  FavoriteView({this.productList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Seus favoritos",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: productList != null && productList.length > 0
          ? GridWidget(productList: productList)
          : Center(
              child: Text('Você não possui favoritos!'),
            ),
    );
  }
}

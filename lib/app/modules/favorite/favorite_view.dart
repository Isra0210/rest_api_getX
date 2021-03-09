import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:storewithgetx/app/controller/controller.dart';
import 'package:storewithgetx/app/models/product_model.dart';
import 'package:storewithgetx/app/widget/grid_widget.dart';

class FavoriteView extends GetView<Controller> {
  final List<Product> productList;

  FavoriteView({this.productList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: productList != null && productList.length > 0
          ? GridWidget(productList: productList)
          : Center(
              child: Text('Você não possui favoritos!'),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:storewithgetx/app/models/product_model.dart';
import 'package:storewithgetx/app/widget/product_tile_widget.dart';

class GridWidget extends GetView {
  final List<Product> productList;

  GridWidget({this.productList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: productList.length,
        itemBuilder: (ctx, i) {
          return ProductTile(productList[i]);
        },
      ),
    );
  }
}

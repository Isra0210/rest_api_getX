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
    return StaggeredGridView.countBuilder(
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      crossAxisCount: 2,
      itemCount: productList.length,
      itemBuilder: (ctx, i) {
        return ProductTile(productList[i]);
      },
      staggeredTileBuilder: (i) => StaggeredTile.fit(1),
    );
  }
}

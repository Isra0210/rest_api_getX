import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storewithgetx/app/controller/controller.dart';
import 'package:storewithgetx/app/modules/favorite/favorite_view.dart';
import 'package:storewithgetx/app/widget/grid_widget.dart';

class HomeView extends GetView {
  final Controller controller = Get.put(Controller());

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
                  productList: controller.productListFavorite,
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
                if (controller.isLoadingRx) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.black),
                    ),
                  );
                } else {
                  return GridWidget(productList: controller.productList);
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}

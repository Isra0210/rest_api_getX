import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storewithgetx/app/controller/controller.dart';
import 'package:storewithgetx/app/widget/grid_widget.dart';

class ProductView extends GetView {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
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

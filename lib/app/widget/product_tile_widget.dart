import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storewithgetx/app/models/product_model.dart';

class ProductTile extends GetView {
  final Product product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(product.imageLink),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 5, left: 8),
                      child: Text(
                        product.name,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.w800,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (product.rating != null)
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    product.rating.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          Text(
                            'R\$${product.price}',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'avenir',
                            ),
                          ),
                          Obx(
                            () => CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: product.isFavorite.value
                                    ? Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                        color: Colors.black,
                                      ),
                                onPressed: () {
                                  if (!product.isFavorite.value) {
                                    controller.productListFavorite.add(product);
                                  } else {
                                    controller.productListFavorite
                                        .remove(product);
                                  }
                                  product.isFavorite.toggle();
                                  print(controller.productListFavorite);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

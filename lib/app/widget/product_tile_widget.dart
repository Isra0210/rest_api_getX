import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storewithgetx/app/models/product_model.dart';

class ProductTile extends GetView {
  final Product product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.network(
                  product.imageLink,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                child: Obx(
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
                          controller.productListFavorite.remove(product);
                        }
                        product.isFavorite.toggle();
                        print(controller.productListFavorite);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Text(
            product.name,
            maxLines: 2,
            style: TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${product.price}',
                  style: TextStyle(fontSize: 18, fontFamily: 'avenir')),
              if (product.rating != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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
            ],
          ),
        ],
      ),
    );
  }
}

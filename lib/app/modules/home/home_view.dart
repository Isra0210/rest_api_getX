import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storewithgetx/app/controller/controller.dart';
import 'package:storewithgetx/app/modules/cart/cart_view.dart';
import 'package:storewithgetx/app/modules/favorite/favorite_view.dart';
import 'package:storewithgetx/app/modules/home/home_controller.dart';
import 'package:storewithgetx/app/modules/product/product_view.dart';
import 'package:storewithgetx/app/widget/drawer_widet.dart';

final HomeController homeController = HomeController();
final Controller controller = Controller();

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> pages = [
    ProductView(),
    FavoriteView(
      productList: controller.productListFavorite,
    ),
    CartView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Store",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: DrawerWidet(),
      body: pages[homeController.index],
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: homeController.index,
          selectedItemColor: Colors.yellow[700],
          unselectedItemColor: Colors.white,
          onTap: (newIndex) {
            setState(() {
              homeController.indexRx.value = newIndex;
            });
          },
          selectedLabelStyle: TextStyle(color: Colors.yellow[700]),
          unselectedLabelStyle: TextStyle(color: Colors.white),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home,
              ),
              label: 'Produtos',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Carrinho',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storewithgetx/app/controller/controller.dart';
import 'package:storewithgetx/app/modules/home/home_view.dart';

void main() {
  Get.put(Controller());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      home: HomeView(),
    );
  }
}

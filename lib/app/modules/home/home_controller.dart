import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt indexRx = 0.obs;
  int get index => indexRx.value;
  setIndex(int index) => indexRx.value = index;
}

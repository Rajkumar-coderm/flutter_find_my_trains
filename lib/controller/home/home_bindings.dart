import 'package:flutter_find_my_train/controller/controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      HomeController.new,
    );
  }
}

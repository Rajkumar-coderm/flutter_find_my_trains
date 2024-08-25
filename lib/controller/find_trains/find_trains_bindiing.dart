import 'package:flutter_find_my_train/controller/controller.dart';
import 'package:get/get.dart';

class FindTrainsBindiing extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      FindTrainsController.new,
    );
  }
}

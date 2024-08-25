import 'package:flutter_find_my_train/lib.dart';
import 'package:get/get.dart';

class RoutManagement {
  static void goToHomePage() async {
    await Get.offAllNamed(Routes.home);
  }

  static void goToFindTrainsPage() async {
    await Get.toNamed(Routes.findTrain);
  }
}

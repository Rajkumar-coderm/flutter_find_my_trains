import 'package:flutter_find_my_train/lib.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const inital = Routes.splash;

  static final appPages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPageView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.home,
      page: HomePageView.new,
      transition: Transition.fadeIn,
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.findTrain,
      page: FindTrainsPageView.new,
      binding: FindTrainsBindiing(),
      transition: Transition.fadeIn,
    )
  ];
}

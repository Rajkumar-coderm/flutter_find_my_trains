import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_find_my_train/lib.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: ColorsValue.primaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarDividerColor: ColorsValue.primaryColor,
        systemStatusBarContrastEnforced: false,
      ),
    );
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        RoutManagement.goToHomePage();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
      );
}

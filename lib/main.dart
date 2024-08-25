import 'package:flutter/material.dart';
import 'package:flutter_find_my_train/lib.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0.0,
          ),
        ),
        initialRoute: AppPages.inital,
        getPages: AppPages.appPages,
        themeMode: ThemeMode.light,
      );
}

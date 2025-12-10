import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sports_app/app/routes/app_routes.dart';
import 'firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Sports News",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH, // أول صفحة بدنا ياها
      getPages: AppPages.routes, // جميع الراوتات من ملف app_pages.dart
      theme: ThemeData(
        primaryColor: const Color(0xff0D47A1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff0D47A1),
          primary: const Color(0xff0D47A1),
          secondary: const Color(0xffFFC107),
        ),
        scaffoldBackgroundColor: const Color(0xfff3f5f7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0D47A1),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        fontFamily: "Cairo",
      ),
    );
  }
}

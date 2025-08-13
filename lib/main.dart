// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_tech_website/features/home/providers/control.dart';

import 'core/utils/app_colors.dart';
import 'features/main/main_view.dart';

void main() {
  runApp( ChangeNotifierProvider(
    create: (context) => Control(),
    child: MyApp(),
  ));
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Tajawal',
        primaryColor: AppColors.black,
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          elevation: 0,
        ),
      ),
      home: MainView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_pref_task2_adlike_view/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: SplashScreen(),
    );
  }
}


import 'package:flutter/material.dart';

import 'package:flutter_various_app/views/splash_screen_ui.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
    ),
  );
}
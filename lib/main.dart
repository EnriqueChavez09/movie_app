import 'package:flutter/material.dart';
import 'package:movie_app/globals/globals.dart';
import 'package:movie_app/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: normalPhoneTheme,
      routes: AppRoutes.getAppRoutes(),
      initialRoute: AppRoutes.initialRoute,
    );
  }
}

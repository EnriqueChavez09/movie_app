import 'package:flutter/material.dart';
import 'package:movie_app/pages/pages.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => HomePage()});
    appRoutes.addAll({'detail': (BuildContext context) => DetailPage()});
    // appRoutes.addAll({'register': (BuildContext context) => RegisterPage()});
    // appRoutes.addAll({'history': (BuildContext context) => HistoryPage()});
    return appRoutes;
  }
}

import 'package:flutter/material.dart';

import '../screens/screens.dart';

abstract class AppRouter {
  static const String routerListUser = 'listUser';
  static const String routerDetailUser = 'detailuser';

  static Map<String, Widget Function(BuildContext)> routes = {
    routerListUser: (BuildContext context) => const ListUserScreen(),
    routerDetailUser: (BuildContext context) => const DetailUserScreens(),
  };
}

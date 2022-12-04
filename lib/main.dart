import 'package:ceiba_publicaciones/helpers/app_colors.dart';
import 'package:ceiba_publicaciones/helpers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'helpers/app_helpers.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  return runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba de Ingreso',
      initialRoute: AppRouter.routerListUser,
      routes: AppRouter.routes,
      theme: ThemeData(
        primarySwatch: AppColor.materialColor,
      ),
    );
  }
}

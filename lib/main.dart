import 'package:escrivah/core/configs/theme.dart';
import 'package:escrivah/core/managers/router_manager.dart';
import 'package:escrivah/core/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  sl<RouterManager>().initRouter();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Escrivah',
      theme: buildTheme(Brightness.light),
      darkTheme: buildTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      routerConfig: sl<RouterManager>().router,
    );
  }
}

import 'package:designs/src/providers/providers.dart';
import 'package:designs/src/routes/routes.dart';
import 'package:designs/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppTheme()),
      ChangeNotifierProvider(create: (_) => SliderShowProvider()),
      ChangeNotifierProvider(create: (_) => PinteresProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeAnimationDuration: const Duration(seconds: 1),
      themeAnimationCurve: Curves.easeInQuad,
      theme: context.watch<AppTheme>().currentTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}


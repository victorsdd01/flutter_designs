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
      ChangeNotifierProvider(create: (_) => PinteresProvider()),
      ChangeNotifierProvider(create: (_) => ShoeProvider()),
      ChangeNotifierProvider(create: (_) => MusicPlayerProvider()),
      

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
      themeAnimationCurve: Curves.ease,
      theme: context.watch<AppTheme>().currentTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}


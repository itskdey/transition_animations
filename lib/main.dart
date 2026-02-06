import 'package:flutter/material.dart';
import 'package:transition_animation/routes/app_routes.dart';
import 'package:transition_animation/routes/page_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.screen1,
      onGenerateRoute: PageRoutes.onGenerateRoute,
    );
  }
}

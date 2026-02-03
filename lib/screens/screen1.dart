import 'package:flutter/material.dart';
import 'package:transition_animation/routes/app_routes.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Screen 1"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.screen2);
              },
              child: Text("Go to Screen 2"),
            ),
          ],
        ),
      ),
    );
  }
}

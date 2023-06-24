import 'package:flutter/material.dart';

class RouteNotFoundScreen extends StatelessWidget {
  const RouteNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
            // child: Image.asset(
            //   Assets.images.launcher_icon,
            //   height: 100,
            //   width: 100,
            // ),
            ),
      ),
    );
  }
}

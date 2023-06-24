import 'package:flutter/material.dart';

import '../../core/constants/assets/asset_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            Assets.images.logo,
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}

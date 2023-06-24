import 'package:adya/src/presentation/loading/widget/jumping_logo.dart';
import 'package:adya/src/presentation/loading/widget/lottie_widget.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        LottieWidget(
            src: 'assets/lotties/loading.json',
            height: MediaQuery.of(context).size.height * 0.6),
        const JumpingLogo()
      ]),
    );
  }
}

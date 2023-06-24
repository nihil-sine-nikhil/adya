import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatefulWidget {
  const LottieWidget({Key? key, required this.src, required this.height})
      : super(key: key);
  final String src;

  final double height;
  @override
  State<LottieWidget> createState() => _LottieWidgetState();
}

class _LottieWidgetState extends State<LottieWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: IgnorePointer(
        ignoring: true,
        child: Center(
          child: Lottie.asset(widget.src, repeat: true, controller: _controller,
              onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
            _controller.repeat();
          }, height: widget.height),
        ),
      ),
    );
  }
}

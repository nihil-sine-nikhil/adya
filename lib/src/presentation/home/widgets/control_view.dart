import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../core/constants/assets/asset_constants.dart';

class ControlsView extends StatelessWidget {
  const ControlsView({
    super.key,
    required this.controller,
    required this.onTap,
  });

  static const List<double> _playbackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            reverseDuration: const Duration(milliseconds: 200),
            child: controller.value.isPlaying
                ? const SizedBox.shrink()
                : Center(
                    child: Image.asset(
                      Assets.images.play,
                      height: 80,
                    ),
                  )),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Positioned(
          top: 50,
          left: 10,
          child: IconButton(
            icon: Image.asset(
              Assets.images.redo,
              height: 45,
            ),
            onPressed: onTap,
            tooltip: 'Go back to previous decision',
          ),
        ),
        Positioned(
          top: 50,
          right: 10,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _playbackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Image.asset(
              Assets.images.speed,
              height: 45,
            ),
          ),
        ),
      ],
    );
  }
}

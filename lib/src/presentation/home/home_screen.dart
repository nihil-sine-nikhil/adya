import 'package:adya/src/core/constants/ui/ui_constants.dart';
import 'package:adya/src/presentation/home/widgets/clicky_button.dart';
import 'package:adya/src/presentation/home/widgets/control_view.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../data/video/model/video_model.dart';
import '../loading/loading_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;
  late Future<void>? _initializeVideoPlayerFuture;
  late int _playBackTime;
  bool isVideoEnded = false;
  String choice = "Let's Rumble";
  List<String> previousChoices = [];

  Future<ClosedCaptionFile> _loadCaptions(String caption) async {
    final String fileContents =
        await DefaultAssetBundle.of(context).loadString(caption);
    return WebVTTCaptionFile(
        fileContents); // For vtt files, use WebVTTCaptionFile
  }

  @override
  void initState() {
    super.initState();
    _initializePlay(playAgainVideoList.first);
  }

  @override
  void dispose() {
    _initializeVideoPlayerFuture = null;
    _controller.pause().then((_) {
      _controller.dispose();
    });
    super.dispose();
  }

  Future<bool> _clearPrevious() async {
    await _controller.pause();
    return true;
  }

  Future<void> _initializePlay(
    Video vid,
  ) async {
    _controller = VideoPlayerController.network(
      vid.url,
      closedCaptionFile: _loadCaptions(vid.caption),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    _controller.addListener(() {
      setState(() {
        _playBackTime = _controller.value.position.inSeconds;
        if (_controller.value.position >= _controller.value.duration) {
          isVideoEnded = true;
        } else {
          isVideoEnded = false;
        }
      });
    });
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      // _controller.seekTo(newCurrentPosition);
      _controller.play();
    });
  }

  Future<void> _startPlay(Video vid) async {
    setState(() {
      _initializeVideoPlayerFuture = null;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      _clearPrevious().then((_) {
        _initializePlay(vid);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double aspectRatio = screenSize.width / screenSize.height;
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IgnorePointer(
                    ignoring: isVideoEnded,
                    child: AspectRatio(
                      aspectRatio: aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          VideoPlayer(_controller),
                          Positioned(
                            bottom: 50,
                            child: ClosedCaption(
                                text: _controller.value.caption.text,
                                textStyle: const TextStyle(
                                    backgroundColor: Colors.transparent,
                                    color: Colors.white,
                                    overflow: TextOverflow.visible)),
                          ),
                          ControlsView(
                              controller: _controller,
                              onTap: () async {
                                _controller.pause();
                                // Redo previous choice container UI
                                _buildRedoChoiceOnTap();
                              }),
                          VideoProgressIndicator(
                            _controller,
                            allowScrubbing: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isVideoEnded)
                    // Pick one choice container UI
                    _buildChoicesContainer()
                ],
              ),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const LoadingScreen();
          }
        },
      ),
    );
  }

  // Pick one choice container UI
  _buildChoicesContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF33363F),
          width: 1.5,
        ),
        color: const Color(0xFFF8FFE9),
        boxShadow: const [
          BoxShadow(
            offset: Offset(3, 3),
            spreadRadius: 2,
            blurRadius: 0,
            color: Color(0xFF33363F),
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Text("Choose", style: CustomAppTheme.kHeading),
        const SizedBox(
          height: 10,
        ),
        ...getNextVideoList(choice)
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ClickyButton(
                  onPressed: () {
                    isVideoEnded = false;
                    _startPlay(e);
                    previousChoices.add(choice);
                    choice = e.choice;
                  },
                  child: Text(e.choice, style: CustomAppTheme.kText),
                ),
              ),
            )
            .toList(),
      ]),
    );
  }

  // Redo previous choice container UI
  _buildRedoChoiceOnTap() async {
    return await showDialog(
        barrierColor: Colors.transparent,
        // barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              // Prevent dialog from being dismissed
              return true;
            },
            child: Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF33363F),
                      width: 1.5,
                    ),
                    color: const Color(0xFFF8FFE9),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(3, 3),
                        spreadRadius: 2,
                        blurRadius: 0,
                        color: Color(0xFF33363F),
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Redo Choice", style: CustomAppTheme.kHeading),
                        const SizedBox(
                          height: 10,
                        ),
                        if (previousChoices.isNotEmpty)
                          ...getNextVideoList(previousChoices.last)
                              .map(
                                (e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: ClickyButton(
                                    color: Colors.orange,
                                    onPressed: () {
                                      _startPlay(e);

                                      previousChoices.removeLast;
                                      choice = e.choice;
                                      Navigator.pop(context);
                                    },
                                    child: Text(e.choice,
                                        style: CustomAppTheme.kText),
                                  ),
                                ),
                              )
                              .toList(),
                        if (previousChoices.isEmpty)
                          Text("No History", style: CustomAppTheme.kText),
                        const SizedBox(
                          height: 30,
                        ),
                      ]),
                )),
          );
        });
  }
}

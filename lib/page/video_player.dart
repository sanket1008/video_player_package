import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _videoPlayerController;

  late CustomVideoPlayerController _customVideoPlayerController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(showSeekButtons: true);

  @override
  void initState() {
    super.initState();
    initiateVideoPlayer();
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomVideoPlayer(
          customVideoPlayerController: _customVideoPlayerController),
    );
  }

  void initiateVideoPlayer() {
    String videoUrl =
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
    var encode=Uri.encodeFull(url);
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(encode),
    )..initialize().then((value) => setState(() {}));

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );
  }
}

String url =
    "https://infyni-prod-upgrade.s3.amazonaws.com/media/courses/2023/03/Infyni_Guitar_for_Beginners_VII-16472.mp4";

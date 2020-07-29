import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yoganath/utilities/setOrientation.dart';

class Class extends StatefulWidget {
  @override
  _ClassState createState() => _ClassState();
}

class _ClassState extends State<Class> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //     'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {
    //       // Plays the video automatically after it is initialized
    //       _controller.play();
    //     });
    //   });
    _controller = VideoPlayerController.asset('assets/videos/exemplo.mp4')
      // TODO Remove the line below after testing.
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    // Adjust orientation to landscape
    setOrientation('landscape');
    return Scaffold(
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(_controller),
                    _PlayPauseOverlay(
                      controller: _controller,
                    ),
                    VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                    )
                  ],
                ),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}

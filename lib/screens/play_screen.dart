// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../models/content_model.dart';
import '../widgets/responsive.dart';

class PlayScreen extends StatelessWidget {
  final Content content;

  PlayScreen({required this.content});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _PlayScreenMobile(content: content),
      desktop: _PlayScreenDesktop(content: content),
    );
  }
}

class _PlayScreenMobile extends StatefulWidget {
  final Content content;

  const _PlayScreenMobile({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  __PlayScreenMobile createState() => __PlayScreenMobile();
}

class __PlayScreenMobile extends State<_PlayScreenMobile> {
  late final VideoPlayerController _videoController;
  late ScrollController _scrollController;
  double volume = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _videoController = VideoPlayerController.network(widget.content.videoUrl)
      ..initialize().then((_) => _videoController.pause())
      ..setVolume(0)
      ..play();
    setLandscape();
  }

  @override
  void dispose() {
    _videoController.dispose();

    setAllOrientations();
    super.dispose();
  }

  Future setLandscape() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    await Wakelock.enable();
  }

  Future setAllOrientations() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);

    await Wakelock.disable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        controller: _scrollController,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 24.0,
            ),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: Colors.white, width: 3.0),
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.only(left: 30.0),
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new),
                      iconSize: 30.0,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent),
            onDoubleTap: () => _videoController.value.isPlaying
                ? _videoController.pause()
                : _videoController.play(),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                AspectRatio(
                  aspectRatio: _videoController.value.isInitialized
                      ? _videoController.value.aspectRatio
                      : 2.344,
                  child: _videoController.value.isInitialized
                      ? VideoPlayer(_videoController)
                      : Image.asset(
                          widget.content.imageUrl,
                          fit: BoxFit.cover,
                        ),
                ),
                VideoProgressIndicator(
                  _videoController,
                  allowScrubbing: true,
                  padding: EdgeInsets.all(10),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon:
                          Icon(Icons.fast_rewind_rounded, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          Duration currentPosition =
                              _videoController.value.position;
                          Duration targetPosition =
                              currentPosition - const Duration(seconds: 10);
                          _videoController.seekTo(targetPosition);
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                          _videoController.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _videoController.value.isPlaying
                              ? _videoController.pause()
                              : _videoController.play();
                        });
                      },
                    ),
                    IconButton(
                      icon:
                          Icon(Icons.fast_forward_rounded, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          Duration currentPosition =
                              _videoController.value.position;
                          Duration targetPosition =
                              currentPosition + const Duration(seconds: 10);
                          _videoController.seekTo(targetPosition);
                        });
                      },
                    ),
                    Text('${_videoController.value.playbackSpeed}x',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    SizedBox(width: 10),
                    Icon(animatedVolumeIcon(volume), color: Colors.white),
                    Slider(
                      value: volume,
                      min: 0,
                      max: 1,
                      onChanged: (_volume) => setState(() {
                        volume = _volume;
                        _videoController.setVolume(_volume);
                      }),
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.download_rounded, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.share_rounded, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayScreenDesktop extends StatefulWidget {
  final Content content;

  const _PlayScreenDesktop({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  __PlayScreenDesktop createState() => __PlayScreenDesktop();
}

class __PlayScreenDesktop extends State<_PlayScreenDesktop> {
  late final VideoPlayerController _videoController;
  double volume = 0.0;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.content.videoUrl)
      ..initialize().then((_) => _videoController.pause())
      ..setVolume(0)
      ..play();
  }

  @override
  void dispose() {
    _videoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 24.0,
            ),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: Colors.white, width: 3.0),
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.only(left: 30.0),
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new),
                      iconSize: 30.0,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _videoController.value.isPlaying
                ? _videoController.pause()
                : _videoController.play(),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                AspectRatio(
                  aspectRatio: _videoController.value.isInitialized
                      ? _videoController.value.aspectRatio
                      : 2.344,
                  child: _videoController.value.isInitialized
                      ? VideoPlayer(_videoController)
                      : Image.asset(
                          widget.content.imageUrl,
                          fit: BoxFit.cover,
                        ),
                ),
                VideoProgressIndicator(
                  _videoController,
                  allowScrubbing: true,
                  padding: EdgeInsets.all(10),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon:
                          Icon(Icons.fast_rewind_rounded, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          Duration currentPosition =
                              _videoController.value.position;
                          Duration targetPosition =
                              currentPosition - const Duration(seconds: 10);
                          _videoController.seekTo(targetPosition);
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                          _videoController.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _videoController.value.isPlaying
                              ? _videoController.pause()
                              : _videoController.play();
                        });
                      },
                    ),
                    IconButton(
                      icon:
                          Icon(Icons.fast_forward_rounded, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          Duration currentPosition =
                              _videoController.value.position;
                          Duration targetPosition =
                              currentPosition + const Duration(seconds: 10);
                          _videoController.seekTo(targetPosition);
                        });
                      },
                    ),
                    Text('${_videoController.value.playbackSpeed}x',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    SizedBox(width: 10),
                    Icon(animatedVolumeIcon(volume), color: Colors.white),
                    Slider(
                      value: volume,
                      min: 0,
                      max: 1,
                      onChanged: (_volume) => setState(() {
                        volume = _volume;
                        _videoController.setVolume(_volume);
                      }),
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.download_rounded, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.share_rounded, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

IconData animatedVolumeIcon(double volume) {
  if (volume == 0) {
    return Icons.volume_mute;
  } else if (volume < 0.5) {
    return Icons.volume_down;
  } else {
    return Icons.volume_up;
  }
}

// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../models/content_model.dart';
import '../widgets/responsive.dart';

class PlayScreen extends StatelessWidget {
  final Content content;

  PlayScreen({
    required this.content,
    Key? key,
  }) : super(key: key);

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
  late ChewieController _chewieController;
  late final VideoPlayerController _videoController;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _videoController = VideoPlayerController.network(widget.content.videoUrl)
      ..initialize().then((_) => _videoController.pause())
      ..setVolume(0)
      ..play();
    setLandscape();

    _chewieController = ChewieController(
      materialProgressColors: ChewieProgressColors(handleColor: Colors.red),
      videoPlayerController: _videoController,
      fullScreenByDefault: true,
      autoInitialize: false,
      allowFullScreen: true,
      aspectRatio: _videoController.value.isInitialized
          ? _videoController.value.aspectRatio
          : 16 / 9,
      looping: false,
      autoPlay: false,
      showControlsOnInitialize: false,
      errorBuilder: (context, errorMessage) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Text(
                "This can't be displayed We are sorry :(",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: Image.asset(
                widget.content.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController.dispose();
    setAllOrientations();
    super.dispose();
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
  late ChewieController _chewieController;
  late final VideoPlayerController _videoController;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _videoController = VideoPlayerController.network(widget.content.videoUrl)
      ..initialize().then((_) => _videoController.pause())
      ..setVolume(0)
      ..play();
    setLandscape();

    _chewieController = ChewieController(
      materialProgressColors: ChewieProgressColors(handleColor: Colors.red),
      videoPlayerController: _videoController,
      fullScreenByDefault: false,
      autoInitialize: false,
      allowFullScreen: true,
      aspectRatio: _videoController.value.isInitialized
          ? _videoController.value.aspectRatio
          : 16 / 9,
      looping: false,
      autoPlay: false,
      showControlsOnInitialize: false,
      errorBuilder: (context, errorMessage) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Text(
                "This can't be displayed We are sorry :(",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: Image.asset(
                widget.content.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          // InkWell(
          //   child: Stack(
          //     alignment: Alignment.center,
          //     children: [
          //       Container(
          //         margin: const EdgeInsets.symmetric(horizontal: 16.0),
          //         height: 130.0,
          //         width: 130.0,
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: AssetImage(widget.content.imageUrl),
          //             fit: BoxFit.cover,
          //           ),
          //           shape: BoxShape.circle,
          //           border: Border.all(color: widget.content.color, width: 4.0),
          //         ),
          //       ),
          //       Container(
          //         height: 130.0,
          //         width: 130.0,
          //         decoration: BoxDecoration(
          //           gradient: const LinearGradient(
          //             colors: [
          //               Colors.black87,
          //               Colors.black45,
          //               Colors.transparent,
          //             ],
          //             stops: [0, 0.25, 1],
          //             begin: Alignment.bottomCenter,
          //             end: Alignment.topCenter,
          //           ),
          //           shape: BoxShape.circle,
          //           border: Border.all(color: widget.content.color, width: 4.0),
          //         ),
          //       ),
          //       Positioned(
          //         left: 0,
          //         right: 0,
          //         bottom: 0,
          //         child: SizedBox(
          //           height: 60.0,
          //           child: Image.asset(widget.content.titleImageUrl),
          //         ),
          //       ),
          //     ],
          //   ),
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController.dispose();
    setAllOrientations();
    super.dispose();
  }
}

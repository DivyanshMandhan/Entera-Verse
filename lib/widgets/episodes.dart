import 'package:entve/models/content_model.dart';
import 'package:entve/widgets/responsive.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../screens/play_screen.dart';

class Episodes extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Episodes({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _EpisodesScreenMobile(title: title, contentList: contentList),
      desktop: _EpisodesScreenDesktop(title: title, contentList: contentList),
    );
  }
}

class _EpisodesScreenMobile extends StatefulWidget {
  final String title;
  final List<Content> contentList;

  const _EpisodesScreenMobile({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  __EpisodesScreenMobile createState() => __EpisodesScreenMobile();
}

class __EpisodesScreenMobile extends State<_EpisodesScreenMobile> {
  late ScrollController _scrollController;

  late int myindex = 0;

  int currindex = 0;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Episodes',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // ignore: sized_box_for_whitespace

        SizedBox(
          height: 165.0,
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 8.0,
              ),
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.contentList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = widget.contentList[index];

                return InkWell(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        height: 180.0,
                        width: 180.0,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side:
                                  BorderSide(width: 4.0, color: content.color)),
                        ),
                      ),
                      Container(
                        height: 180.0,
                        width: 180.0,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.black45,
                              Colors.transparent,
                            ],
                            stops: [0, 0.25, 1],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side:
                                  BorderSide(width: 4.0, color: content.color)),
                        ),
                      ),
                      Positioned(
                          bottom: -20,
                          child: Center(
                            child: SizedBox(
                                height: 60.0,
                                child: Text(
                                  content.name,
                                  style: TextStyle(
                                      color: content.color,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                          )),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PlayScreen(content: content)));

                    setState(() {
                      currindex = index;
                    });
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }
}

class _EpisodesScreenDesktop extends StatefulWidget {
  final String title;
  final List<Content> contentList;

  const _EpisodesScreenDesktop({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  __EpisodesScreenDesktop createState() => __EpisodesScreenDesktop();
}

class __EpisodesScreenDesktop extends State<_EpisodesScreenDesktop> {
  late ScrollController _scrollController;

  late int myindex = 0;

  int currindex = 0;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Episodes',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // ignore: sized_box_for_whitespace

        SizedBox(
          height: 165.0,
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 8.0,
              ),
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.contentList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = widget.contentList[index];

                return InkWell(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        height: 180.0,
                        width: 250.0,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side:
                                  BorderSide(width: 4.0, color: content.color)),
                        ),
                      ),
                      Container(
                        height: 180.0,
                        width: 250.0,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.black45,
                              Colors.transparent,
                            ],
                            stops: [0, 0.25, 1],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side:
                                  BorderSide(width: 4.0, color: content.color)),
                        ),
                      ),
                      Positioned(
                          bottom: -20,
                          child: Center(
                            child: SizedBox(
                                height: 60.0,
                                child: Text(
                                  content.name,
                                  style: TextStyle(
                                      color: content.color,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                          )),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PlayScreen(content: content)));

                    setState(() {
                      currindex = index;
                    });
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

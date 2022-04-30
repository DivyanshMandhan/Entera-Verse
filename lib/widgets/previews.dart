import 'package:entve/models/content_model.dart';
import 'package:entve/widgets/responsive.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../screens/play_screen.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Previews({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _PreviewScreenMobile(title: title, contentList: contentList),
      desktop: _PreviewScreenDesktop(title: title, contentList: contentList),
    );
  }
}

class _PreviewScreenMobile extends StatefulWidget {
  final String title;
  final List<Content> contentList;

  const _PreviewScreenMobile({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  __PreviewScreenMobile createState() => __PreviewScreenMobile();
}

class __PreviewScreenMobile extends State<_PreviewScreenMobile> {
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
            'Featured Shows',
            style: TextStyle(
              color: Colors.white,
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
                          ),
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
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: -30,
                          child: Center(
                            child: SizedBox(
                                height: 60.0,
                                child: Text(
                                  content.name,
                                  style: const TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
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

class _PreviewScreenDesktop extends StatefulWidget {
  final String title;
  final List<Content> contentList;

  const _PreviewScreenDesktop({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  __PreviewScreenDesktop createState() => __PreviewScreenDesktop();
}

class __PreviewScreenDesktop extends State<_PreviewScreenDesktop> {
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
            'Featured Shows',
            style: TextStyle(
              color: Colors.white,
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
                          ),
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
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: -30,
                          child: Center(
                            child: SizedBox(
                                height: 60.0,
                                child: Text(
                                  content.name,
                                  style: const TextStyle(
                                      color: Colors.white70,
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

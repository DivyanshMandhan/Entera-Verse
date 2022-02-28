// ignore_for_file: prefer_const_constructors, avoid_print, todo

import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:entve/cubits/app_bar/app_bar_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:entve/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/album_view.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  late ScrollController _scrollController;
  AudioPlayer player = AudioPlayer();
  bool isplaying = false;
  bool audioplayed = false;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        BlocProvider.of<AppBarCubit>(context)
            .setOffset(_scrollController.offset);
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, scrollOffset) {
            return CustomAppBar(scrollOffset: scrollOffset);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Color(0xFFAF1018),
              Colors.black,
            ],
            stops: const [0, 0.3],
          ),
        ),
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: ListView(
            controller: _scrollController,
            children: [
              CarouselSlider(
                items: [
                  GestureDetector(
                      onTap: () async {
                        if (!isplaying && !audioplayed) {
                          int result = await player.play(
                              'https://video5618.s3.us-east-2.amazonaws.com/entera_verse/ap-dhillon-excuses.mp3');
                          if (result == 1) {
                            setState(() {
                              isplaying = true;
                              audioplayed = true;
                            });
                          } else {
                            print("Error while playing audio.");
                          }
                        } else if (audioplayed && !isplaying) {
                          int result = await player.resume();
                          if (result == 1) {
                            setState(() {
                              isplaying = true;
                              audioplayed = true;
                            });
                          } else {
                            print("Error on resume audio.");
                          }
                        } else {
                          int result = await player.pause();
                          if (result == 1) {
                            setState(() {
                              isplaying = false;
                            });
                          } else {
                            print("Error on pause audio.");
                          }
                        }
                      },
                      onDoubleTap: () async {
                        int result = await player.stop();
                        if (result == 1) {
                          setState(() {
                            isplaying = false;
                            audioplayed = false;
                          });
                        } else {
                          print("Error on stop audio.");
                        }
                      },
                      child: Container(
                        width: 800.0,
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/music/image0.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                  GestureDetector(
                    onTap: () async {
                      if (!isplaying && !audioplayed) {
                        int result = await player.play(
                            'https://video5618.s3.us-east-2.amazonaws.com/entera_verse/billie-eilish-lovely.mp3');
                        if (result == 1) {
                          setState(() {
                            isplaying = true;
                            audioplayed = true;
                          });
                        } else {
                          print("Error while playing audio.");
                        }
                      } else if (audioplayed && !isplaying) {
                        int result = await player.resume();
                        if (result == 1) {
                          setState(() {
                            isplaying = true;
                            audioplayed = true;
                          });
                        } else {
                          print("Error on resume audio.");
                        }
                      } else {
                        int result = await player.pause();
                        if (result == 1) {
                          setState(() {
                            isplaying = false;
                          });
                        } else {
                          print("Error on pause audio.");
                        }
                      }
                    },
                    onDoubleTap: () async {
                      int result = await player.stop();
                      if (result == 1) {
                        setState(() {
                          isplaying = false;
                          audioplayed = false;
                        });
                      } else {
                        print("Error on stop audio.");
                      }
                    },
                    child: Container(
                      width: 800.0,
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/music/image1.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (!isplaying && !audioplayed) {
                        int result = await player.play(
                            'https://video5618.s3.us-east-2.amazonaws.com/entera_verse/Gurenge.mp3');
                        if (result == 1) {
                          setState(() {
                            isplaying = true;
                            audioplayed = true;
                          });
                        } else {
                          print("Error while playing audio.");
                        }
                      } else if (audioplayed && !isplaying) {
                        int result = await player.resume();
                        if (result == 1) {
                          setState(() {
                            isplaying = true;
                            audioplayed = true;
                          });
                        } else {
                          print("Error on resume audio.");
                        }
                      } else {
                        int result = await player.pause();
                        if (result == 1) {
                          setState(() {
                            isplaying = false;
                          });
                        } else {
                          print("Error on pause audio.");
                        }
                      }
                    },
                    onDoubleTap: () async {
                      int result = await player.stop();
                      if (result == 1) {
                        setState(() {
                          isplaying = false;
                          audioplayed = false;
                        });
                      } else {
                        print("Error on stop audio.");
                      }
                    },
                    child: Container(
                      width: 800.0,
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/music/image2.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (!isplaying && !audioplayed) {
                        int result = await player.play(
                            'https://video5618.s3.us-east-2.amazonaws.com/entera_verse/Hardy+Sandhu++Bijlee+Bijlee.mp3');
                        if (result == 1) {
                          setState(() {
                            isplaying = true;
                            audioplayed = true;
                          });
                        } else {
                          print("Error while playing audio.");
                        }
                      } else if (audioplayed && !isplaying) {
                        int result = await player.resume();
                        if (result == 1) {
                          setState(() {
                            isplaying = true;
                            audioplayed = true;
                          });
                        } else {
                          print("Error on resume audio.");
                        }
                      } else {
                        int result = await player.pause();
                        if (result == 1) {
                          setState(() {
                            isplaying = false;
                          });
                        } else {
                          print("Error on pause audio.");
                        }
                      }
                    },
                    onDoubleTap: () async {
                      int result = await player.stop();
                      if (result == 1) {
                        setState(() {
                          isplaying = false;
                          audioplayed = false;
                        });
                      } else {
                        print("Error on stop audio.");
                      }
                    },
                    child: Container(
                      width: 800.0,
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/music/image3.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (!isplaying && !audioplayed) {
                        int result = await player.play(
                            'https://video5618.s3.us-east-2.amazonaws.com/entera_verse/24kgoldn+feat.+Iann+Dior+-+Mood.mp3');
                        if (result == 1) {
                          setState(() {
                            isplaying = true;
                            audioplayed = true;
                          });
                        } else {
                          print("Error while playing audio.");
                        }
                      } else if (audioplayed && !isplaying) {
                        int result = await player.resume();
                        if (result == 1) {
                          setState(() {
                            isplaying = true;
                            audioplayed = true;
                          });
                        } else {
                          print("Error on resume audio.");
                        }
                      } else {
                        int result = await player.pause();
                        if (result == 1) {
                          setState(() {
                            isplaying = false;
                          });
                        } else {
                          print("Error on pause audio.");
                        }
                      }
                    },
                    onDoubleTap: () async {
                      int result = await player.stop();
                      if (result == 1) {
                        setState(() {
                          isplaying = false;
                          audioplayed = false;
                        });
                      } else {
                        print("Error on stop audio.");
                      }
                    },
                    child: Container(
                      width: 800.0,
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/music/image4.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 300.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  viewportFraction: 0.3,
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Have a Good Day :)",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: const [
                        RowAlbumCard(
                          label: "Top 50 - Global",
                          image: AssetImage("assets/images/music/top50.jpg"),
                        ),
                        SizedBox(width: 16),
                        RowAlbumCard(
                          label: "Anime",
                          image: AssetImage("assets/images/music/anime.jpg"),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: const [
                        RowAlbumCard(
                          label: "RapCaviar",
                          image: AssetImage("assets/images/music/rap.jpg"),
                        ),
                        SizedBox(width: 16),
                        RowAlbumCard(
                          label: "BollyWood",
                          image:
                              AssetImage("assets/images/music/bollywood.jpg"),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: const [
                        RowAlbumCard(
                          label: "Top 50 - USA",
                          image:
                              AssetImage("assets/images/music/top-50_usa.jpg"),
                        ),
                        SizedBox(width: 16),
                        RowAlbumCard(
                          label: "HollyWood",
                          image:
                              AssetImage("assets/images/music/hollywood.jpeg"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // TODO: Recently Played
              const SizedBox(height: 40),
              Text(
                "Recently Played",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    AlbumCard(
                      label: "Best Mode",
                      image: AssetImage("assets/images/music/album7.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Motivation Mix",
                      image: AssetImage("assets/images/music/album1.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Top 50-Global",
                      image: AssetImage("assets/images/music/top50.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Power Gaming",
                      image: AssetImage("assets/images/music/album1.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Top songs - Global",
                      image: AssetImage("assets/images/music/album8.jpg"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              // TODO: Made for You
              const SizedBox(height: 40),
              Text(
                "Made for You",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    AlbumCard(
                      label: "Best Mode",
                      image: AssetImage("assets/images/music/album7.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Motivation Mix",
                      image: AssetImage("assets/images/music/album1.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Top 50-Global",
                      image: AssetImage("assets/images/music/top50.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Power Gaming",
                      image: AssetImage("assets/images/music/album1.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Top songs - Global",
                      image: AssetImage("assets/images/music/album8.jpg"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              // TODO: Charts
              const SizedBox(height: 40),
              Text(
                "Charts",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    AlbumCard(
                      label: "Best Mode",
                      image: AssetImage("assets/images/music/album7.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Motivation Mix",
                      image: AssetImage("assets/images/music/album1.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Top 50-Global",
                      image: AssetImage("assets/images/music/top50.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Power Gaming",
                      image: AssetImage("assets/images/music/album1.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Top songs - Global",
                      image: AssetImage("assets/images/music/album8.jpg"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              // TODO: Trending Now
              const SizedBox(height: 40),
              Text(
                "Trending Now",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    AlbumCard(
                      label: "Best Mode",
                      image: AssetImage("assets/images/music/album7.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Motivation Mix",
                      image: AssetImage("assets/images/music/album1.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Top 50-Global",
                      image: AssetImage("assets/images/music/top50.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Power Gaming",
                      image: AssetImage("assets/images/music/album1.jpg"),
                      onTap: () {},
                    ),
                    SizedBox(width: 16),
                    AlbumCard(
                      label: "Top songs - Global",
                      image: AssetImage("assets/images/music/album8.jpg"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;
  const RowAlbumCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final Function onTap;
  final double size;
  const AlbumCard({
    Key? key,
    required this.image,
    required this.label,
    required this.onTap,
    this.size = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumView(
              image: image,
            ),
          ),
        );
      },
      child: Expanded(
          flex: 1,
          child: Container(
            width: 190,
            height: 190,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Center(
                  child: Image(
                    image: image,
                    width: size,
                    height: size,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    label,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

// ignore_for_file: prefer_const_constructors, avoid_print, todo, must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:entve/cubits/app_bar/app_bar_cubit.dart';
import 'package:entve/data/anime_data.dart';
import 'package:entve/data/movies_data.dart';
import 'package:entve/screens/info_screen.dart';
import 'package:entve/screens/music_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:entve/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../assets.dart';
import '../widgets/responsive.dart';

class LatestScreen extends StatelessWidget {
  const LatestScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: _LatestScreenDesktop(key: key),
      mobile: _LatestScreenMobile(key: key),
    );
  }
}

class _LatestScreenDesktop extends StatefulWidget {
  const _LatestScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  __LatestScreenDesktop createState() => __LatestScreenDesktop();
}

class __LatestScreenDesktop extends State<_LatestScreenDesktop> {
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
              Colors.green,
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
                  Container(
                    width: 800.0,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/movies/doctorstrange.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 800.0,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/anime/trappedinadating.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 800.0,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/movies/thorloveandthunder.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 800.0,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/images/anime/acoupleof.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
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
                      "Movies",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                            image: AssetImage(Assets.badguys),
                            label: 'Bad Guys',
                            year: '2022',
                            rating: '7.0',
                            description:
                                "The Bad Guys is a 2022 American computer-animated crime comedy film produced by DreamWorks Animation and distributed by Universal Pictures. The film was directed by Pierre Perifel\n(in his feature directorial debut) from a screenplay by Etan Cohen, and is loosely based on the children's book series of the same name by Aaron Blabey. The film stars the voices of\nSam Rockwell, Marc Maron, Awkwafina, Craig Robinson, Anthony Ramos, Richard Ayoade, Zazie Beetz, Alex Borstein, and Lilly Singh. It tells the story of a group of criminal animals\nwho, upon being caught, pretend to attempt to reform themselves as model citizens as a new villain has his own plans.",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: trending[0])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                          image: AssetImage(Assets.doctorStrange),
                          label: 'Doctor Strange in the Multiverse of Madness',
                          year: '2022',
                          rating: '9.1',
                          description:
                              "Marvel Studios' \"Doctor Strange in the Multiverse of Madness\"—a thrilling ride through the Multiverse with Doctor Strange, his trusted friend Wong and Wanda Maximoff, aka Scarlet Witch.\n\"Doctor Strange in the Multiverse of Madness\" opens in U.S. theaters on May 6, 2022.",
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfoScreen(content: trending[1])));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                            image: AssetImage(Assets.jurassicWorld),
                            label: 'Jurassic World Dominion',
                            year: '2022',
                            rating: '8.1',
                            description:
                                "The future of mankind hangs in the balance as humans and dinosaurs coexist following the destruction of Isla Nublar.",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: trending[2])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                            image: AssetImage(Assets.theUnbearable),
                            label: 'The Unbearable Weight of Massive Talent',
                            year: '2022',
                            rating: '7.7',
                            description:
                                "Unfulfilled and facing financial ruin, actor Nick Cage accepts a \$1 million offer to attend a wealthy fan's birthday party. Things take a wildly unexpected turn when a CIA operative\nrecruits Cage for an unusual mission. Taking on the role of a lifetime, he soon finds himself channeling his most iconic and beloved characters to save himself and his loved ones.",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: trending[3])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                            image: AssetImage(Assets.thorLoveandThunder),
                            label: 'Thor: Love and Thunder',
                            year: '2022',
                            rating: '8.8',
                            description:
                                "Thor's retirement is interrupted by a galactic killer known as Gorr the God Butcher, who seeks the extinction of the gods. To combat the threat, Thor enlists the help of King Valkyrie,\nKorg and ex-girlfriend Jane Foster, who - to Thor's surprise - inexplicably wields his magical hammer, Mjolnir, as the Mighty Thor. Together, they embark upon a harrowing cosmic adventure\nto uncover the mystery of the God Butcher's vengeance and stop him before it's too late.",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: trending[4])));
                            }),
                      ],
                    ),
                    SizedBox(height: 40),
                    //Anime
                    Text(
                      "Anime",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                            image: AssetImage(Assets.onepiece),
                            label: 'One Piece',
                            year: '1999',
                            rating: '8.63',
                            description:
                                "Gol D. Roger was known as the 'Pirate King,' the strongest and most infamous being to have sailed the Grand Line. The capture and execution\nof Roger by the World Government brought a change throughout the world. His last words before his death revealed the existence of the\ngreatest treasure in the world, One Piece. It was this revelation that brought about the Grand Age of Pirates, men who dreamed of finding One\nPiece—which promises an unlimited amount of riches and fame—and quite possibly the pinnacle of glory and the title of the Pirate King.",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: topAiring[0])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                          image: AssetImage(Assets.holograffiti),
                          label: 'Holo Graffiti',
                          year: '2019',
                          rating: '9.1',
                          description:
                              "From unraveling the secrets of opening and closing doors to defusing surprise packages more commonly known as bombs, there is never a dull\nday at the Hololive Production office! Holo no Graffiti follows an eccentric cast of Virtual YouTubers, also known as 'VTubers,' going about their\nabsurd yet hilarious daily lives, detailing all their cute moments and mishaps.",
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfoScreen(content: topAiring[1])));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                            image: AssetImage(Assets.yaboy),
                            label: 'Ya Boy Kongming!',
                            year: '2022',
                            rating: '8.35',
                            description:
                                "General of the Three Kingdoms, Kongming had struggled his whole life, facing countless battles that made him into the accomplished strategist\nhe was. So on his deathbed, he wished only to be reborn into a peaceful world... and was sent straight to modern-day party-central, Tokyo! Can\neven a brilliant strategist like Kongming adapt to the wild beats and even wilder party people?!",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: topAiring[2])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                            image: AssetImage(Assets.summertime),
                            label: 'Summer Time Rendering',
                            year: '2022',
                            rating: '8.26',
                            description:
                                "After his parents died, Shinpei Ajiro lived with the Kofune sisters, Mio and Ushio, but he has since moved to live on his own in Tokyo. But after\nUshio drowns while trying to save the young Shiori Kobayakawa, he returns home to mourn her departure. However, bruises around Ushio's\nneck bring her cause of death into question.\n\nTaking a step back, Shinpei becomes convinced there must be another explanation. Dangerous entities roam among the islanders, and a vision\nof deceased Ushio asks him to 'save Mio' as her final request. He is certain that something is afoot—and Ushio's death is only a piece of the\npuzzle.",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: topAiring[3])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                            image: AssetImage(Assets.detectiveconan),
                            label: 'Detective Conan',
                            year: '1996',
                            rating: '8.16',
                            description:
                                "Shinichi Kudou, a high school student of astounding talent in detective work, is well known for having solved several challenging cases. One\nday, when Shinichi spots two suspicious men and decides to follow them, he inadvertently becomes witness to a disturbing illegal activity.\nUnfortunately, he is caught in the act, so the men dose him with an experimental drug formulated by their criminal organization, leaving him to\nhis death. However, to his own astonishment, Shinichi lives to see another day, but now in the body of a seven-year-old child.",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: topAiring[4])));
                            }),
                      ],
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Music",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 16),
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
            ],
          ),
        ),
      ),
    );
  }
}

class _LatestScreenMobile extends StatefulWidget {
  const _LatestScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  __LatestScreenMobile createState() => __LatestScreenMobile();
}

class __LatestScreenMobile extends State<_LatestScreenMobile> {
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
              Colors.green,
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
                  Container(
                    width: 800.0,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/movies/doctorstrange.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 800.0,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/anime/trappedinadating.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 800.0,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/movies/thorloveandthunder.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 800.0,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/images/anime/acoupleof.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
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
                      "Movies",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                            image: AssetImage(Assets.badguys),
                            label: 'Bad Guys',
                            year: '2022',
                            rating: '7.0',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: trending[0])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                          image: AssetImage(Assets.doctorStrange),
                          label: 'Doctor Strange in the Multiverse..',
                          year: '2022',
                          rating: '9.1',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfoScreen(content: trending[1])));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                          image: AssetImage(Assets.jurassicWorld),
                          label: 'Jurassic World Dominion',
                          year: '2022',
                          rating: '8.1',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfoScreen(content: trending[2])));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                          image: AssetImage(Assets.theUnbearable),
                          label: 'The Unbearable Weight of Massi..',
                          year: '2022',
                          rating: '7.7',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfoScreen(content: trending[3])));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                          image: AssetImage(Assets.thorLoveandThunder),
                          label: 'Thor: Love and Thunder',
                          year: '2022',
                          rating: '8.8',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfoScreen(content: trending[4])));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    //Anime
                    Text(
                      "Anime",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                            image: AssetImage(Assets.onepiece),
                            label: 'One Piece',
                            year: '1999',
                            rating: '8.63',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: topAiring[0])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                          image: AssetImage(Assets.holograffiti),
                          label: 'Holo Graffiti',
                          year: '2019',
                          rating: '9.1',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfoScreen(content: topAiring[1])));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                            image: AssetImage(Assets.yaboy),
                            label: 'Ya Boy Kongming!',
                            year: '2022',
                            rating: '8.35',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: topAiring[2])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                            image: AssetImage(Assets.summertime),
                            label: 'Summer Time Rendering',
                            year: '2022',
                            rating: '8.26',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: topAiring[3])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                            image: AssetImage(Assets.detectiveconan),
                            label: 'Detective Conan',
                            year: '1996',
                            rating: '8.16',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: topAiring[4])));
                            }),
                      ],
                    ),
                    SizedBox(height: 40),
                    //Music
                    Text(
                      "Music",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 16),
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
            ],
          ),
        ),
      ),
    );
  }
}

class LatestCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final VoidCallback onTap;
  String? year;
  String? rating;
  String? description;

  LatestCard({
    Key? key,
    required this.image,
    required this.label,
    required this.onTap,
    this.year,
    this.rating,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: onTap,
                child: Image(
                  image: image,
                  width: 200,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Center(
                    child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                )),
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Year ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70),
                        ),
                        Text(
                          year!,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(width: 100),
                    Column(
                      children: [
                        Text(
                          'Rating ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70),
                        ),
                        Text(
                          rating!,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Description ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
                SizedBox(height: 5),
                Text(
                  description!,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LatestCardMobile extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final VoidCallback onTap;
  String? year;
  String? rating;

  LatestCardMobile({
    Key? key,
    required this.image,
    required this.label,
    required this.onTap,
    this.year,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: onTap,
                child: Image(
                  image: image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Center(
                    child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                )),
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Year ',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70),
                        ),
                        Text(
                          year!,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Rating ',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70),
                        ),
                        Text(
                          rating!,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
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

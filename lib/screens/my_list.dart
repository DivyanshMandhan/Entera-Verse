// ignore_for_file: prefer_const_constructors, avoid_print, todo, must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:entve/cubits/app_bar/app_bar_cubit.dart';
import 'package:entve/data/anime_data.dart';
import 'package:entve/data/movies_data.dart';
import 'package:entve/screens/info_screen.dart';
import 'package:entve/screens/latest_screen.dart';
import 'package:entve/screens/music_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:entve/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../assets.dart';
import '../widgets/responsive.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: _MyListScreenDesktop(key: key),
      mobile: _MyListScreenMobile(key: key),
    );
  }
}

class _MyListScreenDesktop extends StatefulWidget {
  const _MyListScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  __MyListScreenDesktop createState() => __MyListScreenDesktop();
}

class __MyListScreenDesktop extends State<_MyListScreenDesktop> {
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
              Colors.brown,
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
                            image: AssetImage(Assets.peakyBlinders),
                            label: 'Peaky Blinders',
                            year: '2013',
                            rating: '8.8',
                            description:
                                "Tommy Shelby, a dangerous man, leads the Peaky \nBlinders, a gang based in Birmingham. Soon, Chester \nCampbell, an inspector, decides to nab him and put \nan end to the criminal activities.",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: m_myList[0])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                          image: AssetImage(Assets.lucifer),
                          label: 'Lucifer',
                          year: '2016',
                          rating: '8.2',
                          description:
                              "Based on characters created by Neil Gaiman, Sam \nKieth and Mike Dringenberg, this series follows \nLucifer, the original fallen angel, who has become \ndissatisfied with his life in hell. After abandoning his \nthrone and retiring to Los Angeles, Lucifer indulges in \nhis favorite things (women, wine and song) -- until a \nmurder takes place outside of his upscale nightclub. \nFor the first time in billions of years, the murder \nawakens something unfamiliar in Lucifer's soul that is \neerily similar to compassion and sympathy. Lucifer is \nfaced with another surprise when he meets an \nintriguing homicide detective named Chloe, who \nappears to possess an inherent goodness -- unlike \nthe worst of humanity, to which he is accustomed. \nSuddenly, Lucifer starts to wonder if there is hope for \nhis soul.",
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfoScreen(content: m_myList[1])));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                            image: AssetImage(Assets.inbetween),
                            label: 'The In Between',
                            year: '2022',
                            rating: '5.8',
                            description:
                                "Tessa doesn't believe she deserves her own love \nstory until she meets Skylar, a true romantic. When a \ncar accident kills Skylar, Tessa searches for answers \nand thinks that Skylar is trying to connect with her \nfrom the afterworld. Tessa tries to contact Skylar one \nlast time so their love story can have the ending it \ndeserves.",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: m_myList[2])));
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
                                      InfoScreen(content: m_myList[3])));
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
                            image: AssetImage(Assets.spyfamily),
                            label: 'Spy x Family',
                            year: '2022',
                            rating: '9.09',
                            description:
                                "For the agent known as 'Twilight,' no order is too tall if it is for the sake of peace. Operating as Westalis' master spy, Twilight works tirelessly to\nprevent extremists from sparking a war with neighboring country Ostania. For his latest mission, he must investigate Ostanian politician\nDonovan Desmond by infiltrating his son's school: the prestigious Eden Academy. Thus, the agent faces the most difficult task of his career: get\nmarried, have a child, and play family.",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: A_myList[0])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCard(
                          image: AssetImage(Assets.acoupleof),
                          label: 'A Couple of Cuckoos',
                          year: '2022',
                          rating: '7.68',
                          description:
                              '16-year-old super-studier Nagi Umino, second-year student at the Meguro River Academy high school, was switched at birth. On his way to a\ndinner to meet his birth parents, he accidentally meets the brash, outspoken, Erika Amano, who is determined to make Nagi her fake boyfriend\nas she never wants to actually marry. But once Nagi makes it to dinner, he finds his parents have decided to resolve the hospital switch by\nconveniently having him marry the daughter his birth parents raised...who turns out to be none other than Erika herself!',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfoScreen(content: A_myList[1])));
                          },
                        ),
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

class _MyListScreenMobile extends StatefulWidget {
  const _MyListScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  __MyListScreenMobile createState() => __MyListScreenMobile();
}

class __MyListScreenMobile extends State<_MyListScreenMobile> {
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
              Colors.brown,
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
                            image: AssetImage(Assets.peakyBlinders),
                            label: 'Peaky Blinders',
                            year: '2013',
                            rating: '8.8',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: m_myList[0])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                          image: AssetImage(Assets.lucifer),
                          label: 'Lucifer',
                          year: '2016',
                          rating: '8.2',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfoScreen(content: m_myList[1])));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                            image: AssetImage(Assets.inbetween),
                            label: 'The In Between',
                            year: '2022',
                            rating: '5.8',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: m_myList[2])));
                            }),
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
                                      InfoScreen(content: m_myList[3])));
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
                        LatestCardMobile(
                            image: AssetImage(Assets.spyfamily),
                            label: 'Spy x Family',
                            year: '2022',
                            rating: '9.09',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      InfoScreen(content: A_myList[0])));
                            }),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        LatestCardMobile(
                          image: AssetImage(Assets.acoupleof),
                          label: 'A Couple of Cuckoos',
                          year: '2022',
                          rating: '7.68',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfoScreen(content: A_myList[1])));
                          },
                        ),
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

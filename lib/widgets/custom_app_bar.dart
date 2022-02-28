// ignore_for_file: todo,avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_function_declarations_over_variables, sized_box_for_whitespace

import 'package:entve/screens/nav_screen/anime_nav_screen.dart';
import 'package:entve/screens/nav_screen/nav_screen.dart';

import 'package:entve/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:entve/assets.dart';

import '../screens/nav_screen/music_nav_screen.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({
    Key? key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatefulWidget {
  @override
  __CustomAppBarMobile createState() => __CustomAppBarMobile();
}

class __CustomAppBarMobile extends State<_CustomAppBarMobile>
    with SingleTickerProviderStateMixin {
  int toggle = 0;

  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.entverse),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                Container(
                  width: 250.0,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(color: Colors.white, width: 3.0),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -10.0,
                        left: -4.0,
                        child: AnimatedOpacity(
                          opacity: 1.0,
                          duration: Duration(milliseconds: 200),
                          child: IconButton(
                            iconSize: 22.0,
                            color: Colors.white,
                            icon: Icon(Icons.search_rounded),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 375),
                        left: 25.0,
                        curve: Curves.easeOut,
                        top: 0.0,
                        child: AnimatedOpacity(
                          opacity: 1.0,
                          duration: Duration(milliseconds: 200),
                          child: Container(
                            height: 23.0,
                            width: 180.0,
                            child: TextField(
                              controller: _textEditingController,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                              ),
                              cursorRadius: Radius.circular(50.0),
                              cursorWidth: 2.0,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText: 'Search',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 3.0,
                        right: 5.0,
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              _textEditingController.clear();
                            },
                            child: Icon(
                              Icons.clear,
                              size: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.notifications_outlined),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () => print('Notifications'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatefulWidget {
  @override
  __CustomAppBarDesktop createState() => __CustomAppBarDesktop();
}

class __CustomAppBarDesktop extends State<_CustomAppBarDesktop>
    with SingleTickerProviderStateMixin {
  int toggle = 0;
  late AnimationController _con;
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 375),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.entverseWeb),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TODO : MOVIES
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: getColor(Colors.white12, Colors.orange),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NavScreen()));
                  },
                  child: Text(
                    'Movies',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // TODO : ANIME
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: getColor(Colors.white12, Colors.red),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AnimeNavScreen()));
                  },
                  child: Text(
                    'Anime',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // TODO : MUSIC
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: getColor(Colors.white12, Colors.yellow),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MusicNavScreen()));
                  },
                  child: Text(
                    'Music',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // TODO: LATEST
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: getColor(Colors.white12, Colors.blue),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                  ),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => AnimeNavScreen()));
                  },
                  child: Text(
                    'Latest',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // TODO: MY LIST
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: getColor(Colors.white12, Colors.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                  ),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => AnimeNavScreen()));
                  },
                  child: Text(
                    'MyList',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                AnimatedContainer(
                  duration: Duration(milliseconds: 375),
                  width: (toggle == 0) ? 30.0 : 250.0,
                  curve: Curves.easeOut,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(color: Colors.white, width: 3.0),
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        top: -8.0,
                        left: -8.0,
                        duration: Duration(milliseconds: 375),
                        curve: Curves.easeOut,
                        child: AnimatedOpacity(
                          opacity: 1.0,
                          duration: Duration(milliseconds: 200),
                          child: IconButton(
                            iconSize: 22.0,
                            color: Colors.white,
                            icon: Icon(Icons.search_rounded),
                            onPressed: () {
                              setState(
                                () {
                                  if (toggle == 0) {
                                    toggle = 1;
                                    _con.forward();
                                  } else {
                                    toggle = 0;
                                    _textEditingController.clear();
                                    _con.reverse();
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 375),
                        left: (toggle == 0) ? 20.0 : 40.0,
                        curve: Curves.easeOut,
                        top: 0.0,
                        child: AnimatedOpacity(
                          opacity: (toggle == 0) ? 0.0 : 1.0,
                          duration: Duration(milliseconds: 200),
                          child: Container(
                            height: 23.0,
                            width: 180.0,
                            child: TextField(
                              controller: _textEditingController,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                              ),
                              cursorRadius: Radius.circular(50.0),
                              cursorWidth: 2.0,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText: 'Search',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 375),
                        top: 3.0,
                        right: (toggle == 0) ? 20.0 : 5.0,
                        curve: Curves.easeOut,
                        child: Container(
                          child: AnimatedBuilder(
                            child: GestureDetector(
                              onTap: () {
                                _textEditingController.clear();
                              },
                              child: Icon(
                                Icons.clear,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            builder: (context, widget) {
                              return Transform.rotate(
                                angle: _con.value * 2.0 * 22 / 7,
                                child: widget,
                              );
                            },
                            animation: _con,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.notifications_outlined),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () => print('Notifications'),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.power_settings_new_rounded),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () => print('Logout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return colorPressed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }
}

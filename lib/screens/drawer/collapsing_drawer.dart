// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields

import 'package:entve/screens/collapsing_list.dart';
import 'package:entve/screens/nav_screen/latest_nav_screen.dart';
import 'package:entve/screens/nav_screen/music_nav_screen.dart';
import 'package:entve/screens/nav_screen/my_list_nav_screen.dart';
import 'package:entve/screens/nav_screen/nav_screen.dart';
import 'package:entve/screens/nav_screen/anime_nav_screen.dart';
import 'package:flutter/material.dart';

import '../../models/navigation_model.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 70;
  bool isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  final List<Widget> _screens = [
    NavScreen(),
    AnimeNavScreen(),
    MusicNavScreen(),
    LatestNavScreen(),
    MyListNavScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return const Divider(height: 12.0);
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = counter;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => _screens[counter]));
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    color: navigationItems[counter].color,
                    animationController: _animationController,
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
            CollapsingListTile(
              title: 'Log Out',
              icon: Icons.power_settings_new_rounded,
              animationController: _animationController,
              color: Colors.grey,
              onTap: () {},
            ),
            Divider(color: Colors.grey, height: 40.0),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}

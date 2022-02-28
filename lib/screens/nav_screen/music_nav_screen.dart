// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:entve/cubits/app_bar/app_bar_cubit.dart';
import 'package:entve/screens/music_screen.dart';
import 'package:entve/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../drawer/anime_collapsing_drawer.dart';

class MusicNavScreen extends StatefulWidget {
  @override
  _MusicNavScreenState createState() => _MusicNavScreenState();
}

class _MusicNavScreenState extends State<MusicNavScreen> {
  final List<Widget> _screens = [
    MusicScreen(key: PageStorageKey('MusicScreen')),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = {
    'Home': Icons.home,
    'Downloads': Icons.file_download,
    'Menu': Icons.menu,
  };

  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  void _onItemTapped(int index) {
    index == 2
        ? _drawerKey.currentState!.openDrawer()
        : setState(() {
            _currentIndex = index;
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: AnimeCollapsingDrawer(),
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              items: _icons
                  .map((title, icon) => MapEntry(
                      title,
                      BottomNavigationBarItem(
                        icon: Icon(icon, size: 30.0),
                        label: title,
                      )))
                  .values
                  .toList(),
              currentIndex: _currentIndex,
              selectedItemColor: Colors.white,
              selectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 11.0,
              onTap: _onItemTapped,
            )
          : null,
    );
  }
}

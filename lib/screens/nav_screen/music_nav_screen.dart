// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:entve/cubits/cubits.dart';

import 'package:entve/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicNavScreen extends StatefulWidget {
  @override
  _MusicNavScreenState createState() => _MusicNavScreenState();
}

class _MusicNavScreenState extends State<MusicNavScreen> {
  final List<Widget> _screens = [
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onTap: (index) => setState(() => _currentIndex = index),
            )
          : null,
    );
  }
}

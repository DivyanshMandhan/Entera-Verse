import 'package:flutter/material.dart';

class NavigationModel {
  final String title;
  final IconData icon;
  final Color color;

  NavigationModel({
    required this.title,
    required this.icon,
    required this.color,
  });
}

List<NavigationModel> navigationItems = [
  NavigationModel(
    title: "Movies",
    icon: Icons.local_movies,
    color: Colors.orange,
  ),
  NavigationModel(
    title: "Anime",
    icon: Icons.catching_pokemon,
    color: Colors.red,
  ),
  NavigationModel(
    title: "Music",
    icon: Icons.music_note_rounded,
    color: Colors.yellow,
  ),
  NavigationModel(
    title: "Latest",
    icon: Icons.whatshot,
    color: Colors.blue,
  ),
  NavigationModel(
    title: "MyList",
    icon: Icons.list_alt_rounded,
    color: Colors.green,
  ),
];

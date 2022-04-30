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
    color: Colors.white,
  ),
  NavigationModel(
    title: "Anime",
    icon: Icons.catching_pokemon,
    color: Colors.white,
  ),
  NavigationModel(
    title: "Music",
    icon: Icons.music_note_rounded,
    color: Colors.white,
  ),
  NavigationModel(
    title: "Latest",
    icon: Icons.whatshot,
    color: Colors.white,
  ),
  NavigationModel(
    title: "MyList",
    icon: Icons.list_alt_rounded,
    color: Colors.white,
  ),
];

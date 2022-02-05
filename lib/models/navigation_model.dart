import 'package:flutter/material.dart';

class NavigationModel {
  final String title;
  final IconData icon;

  NavigationModel({required this.title, required this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(
    title: "Movies",
    icon: Icons.local_movies,
  ),
  NavigationModel(
    title: "Anime",
    icon: Icons.catching_pokemon,
  ),
  NavigationModel(
    title: "Music",
    icon: Icons.music_note_rounded,
  ),
  NavigationModel(
    title: "Latest",
    icon: Icons.whatshot,
  ),
  NavigationModel(
    title: "MyList",
    icon: Icons.list_alt_rounded,
  ),
];

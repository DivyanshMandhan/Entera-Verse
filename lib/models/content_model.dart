// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Content {
  final String name;
  final String imageUrl;

  final String titleImageUrl;
  final String videoUrl;
  final String description;
  final Color color;
  final String categories;
  int? year;
  int? length;
  int? episodes;
  final String rating;
  List<Content>? eps;
  List<String>? screenshots;

  Content({
    required this.name,
    required this.imageUrl,
    this.titleImageUrl = "",
    this.videoUrl = "",
    this.description = "",
    this.categories = "",
    this.year,
    this.length,
    this.episodes,
    this.rating = "",
    this.eps,
    this.screenshots,
    this.color = const Color.fromARGB(255, 0, 0, 0),
  });
}

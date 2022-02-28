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
  final int year;
  final int length;
  final String star;
  // final List<String> screenshots;

  const Content({
    required this.name,
    required this.imageUrl,
    this.titleImageUrl = "",
    this.videoUrl = "",
    this.description = "",
    this.categories = "",
    this.year = 2000,
    this.length = 120,
    this.star = '⭐ ⭐ ⭐ ⭐',
    // required this.screenshots,
    this.color = const Color.fromARGB(255, 0, 0, 0),
  });
}

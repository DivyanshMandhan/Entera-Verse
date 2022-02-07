import 'package:entve/data/music_data.dart';
import 'package:flutter/material.dart';

class CurrentTrackModel extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song track) {
    selected = track;
    notifyListeners();
  }
}

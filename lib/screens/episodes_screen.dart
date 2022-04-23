// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:entve/data/episodes_data.dart';
import 'package:flutter/material.dart';

import '../models/content_model.dart';
import '../widgets/circular_clipper.dart';
import '../widgets/episodes.dart';

class EpisodesScreen extends StatefulWidget {
  final Content content;

  EpisodesScreen({required this.content});

  @override
  _EpisodesScreenState createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.content.imageUrl,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: const Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 500.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(widget.content.imageUrl),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 24.0,
                ),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(color: Colors.white, width: 3.0),
                        ),
                        child: IconButton(
                          padding: const EdgeInsets.only(left: 30.0),
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios_new),
                          iconSize: 30.0,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.content.name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                Text(
                  widget.content.categories,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 12.0),
                SizedBox(height: 15.0),
                Episodes(
                  key: PageStorageKey('previews'),
                  title: 'Previews',
                  contentList: moonKnighteps,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

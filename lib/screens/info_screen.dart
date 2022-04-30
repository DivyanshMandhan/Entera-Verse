// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, must_be_immutable

import 'package:entve/screens/play_screen.dart';
import 'package:flutter/material.dart';

import '../models/content_model.dart';
import '../widgets/circular_clipper.dart';
import '../widgets/episodes.dart';

class InfoScreen extends StatefulWidget {
  final Content content;

  InfoScreen({required this.content});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: const EdgeInsets.all(10.0),
                    elevation: 12.0,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              PlayScreen(content: widget.content)));
                    },
                    shape: const CircleBorder(),
                    fillColor: Colors.black,
                    child: const Icon(
                      Icons.play_arrow_outlined,
                      size: 60.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: IconButton(
                  onPressed: () => print('Add to My List'),
                  icon: const Icon(Icons.add),
                  iconSize: 40.0,
                  color: Colors.black,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 25.0,
                child: IconButton(
                  onPressed: () => print('Share'),
                  icon: const Icon(Icons.share),
                  iconSize: 35.0,
                  color: Colors.black,
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
                TextButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 4.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    fixedSize: MaterialStateProperty.all(Size(100.0, 20.0)),
                    elevation: MaterialStateProperty.all(10),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "IMDB",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Container(color: Colors.black, height: 20, width: 4),
                      Text(widget.content.rating),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Year',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.content.year.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Length',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          '${widget.content.length} min',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Episodes',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          '${widget.content.episodes}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25.0),
                SizedBox(
                  height: 120.0,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.content.description,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                SizedBox(height: 15.0),
                Episodes(
                  key: PageStorageKey('episodes'),
                  title: 'Episodes',
                  contentList: widget.content.eps,
                ),
              ],
            ),
          ),
          // ContentScroll(
          //   images: widget.content.screenshots,
          //   title: 'Screenshots',
          //   imageHeight: 200.0,
          //   imageWidth: 250.0,
          // ),
        ],
      ),
    );
  }
}

// class ContentScroll extends StatelessWidget {
//   List<String>? images;
//   final String title;
//   final double imageHeight;
//   final double imageWidth;

//   ContentScroll({
//     this.images,
//     required this.title,
//     required this.imageHeight,
//     required this.imageWidth,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 title,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () => print('View $title'),
//                 child: const Icon(
//                   Icons.arrow_forward,
//                   color: Colors.black,
//                   size: 30.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: imageHeight,
//           child: ListView.builder(
//             padding: const EdgeInsets.symmetric(horizontal: 30.0),
//             scrollDirection: Axis.horizontal,
//             itemCount: images!.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                 margin: const EdgeInsets.symmetric(
//                   horizontal: 10.0,
//                   vertical: 20.0,
//                 ),
//                 width: imageWidth,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black54,
//                       offset: Offset(0.0, 4.0),
//                       blurRadius: 6.0,
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0),
//                   child: Image(
//                     image: AssetImage(images![index]),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

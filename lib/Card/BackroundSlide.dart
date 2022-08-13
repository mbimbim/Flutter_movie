import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BackroundSlide extends StatelessWidget {
  String backround_img;
  String poster_path;
  String original_title;

  BackroundSlide(
      {Key? key,
      required this.backround_img,
      required this.poster_path,
      required this.original_title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 430,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/original' + backround_img),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
        ),
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/original' + poster_path,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Positioned(
            top: 60,
            child: Text(
              original_title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ],
    );
  }
}

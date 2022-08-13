import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tes_movie/Models/Model_Videos.dart';

import '../Page/Play_Video.dart';

class ListVidoe extends StatelessWidget {
  Result result_model;
  ListVidoe({Key? key, required this.result_model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('id_videoss ' + result_model.key.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlayVideo(
                      id_videos: result_model.key.toString(),
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      height: 100,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://i3.ytimg.com/vi_webp/${result_model.key}/sddefault.webp',
                          fit: BoxFit.fill,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      )),
                  Center(
                      child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  ))
                ],
              ),
              Container(
                width: 220,
                child: Column(
                  children: [
                    Text(
                      '${result_model.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.kiwiMaru().copyWith(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${result_model.type}',
                      style: GoogleFonts.kaushanScript().copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 17, 112, 190)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

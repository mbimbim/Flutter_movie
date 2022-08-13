// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:tes_movie/Card/List_Video.dart';
import 'package:tes_movie/Models/Model_Detail.dart';
import 'package:tes_movie/Models/Model_Videos.dart';
import 'package:tes_movie/Page/Play_Video.dart';
import 'package:tes_movie/Provider/Provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Detail_page extends StatefulWidget {
  String ids = '';
  Detail_page({Key? key, required this.ids}) : super(key: key);

  @override
  State<Detail_page> createState() => _Detail_pageState();
}

class _Detail_pageState extends State<Detail_page> {
  var count = '0';
  var _provider = Providers();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Provider.of<Providers>(context, listen: false).clear();
    //  Provider.of<Providers>(context, listen: false).getDetail(widget.ids);
  }

  @override
  Widget build(BuildContext context) {
    // print('idantar ' + widget.ids);
    //Provider.of<Providers>(context, listen: false).getDetail(widget.ids);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 14, 14),
      body: SingleChildScrollView(child: Container(child: Consumer<Providers>(
        builder: (context, value, child) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350,

                    child:
                        //     Container()
                        CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original${value.path}',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    //     Image.network(
                    //   'https://image.tmdb.org/t/p/original' + value.path,
                    //   fit: BoxFit.cover,
                    // ),
                  ),

                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            gradient: LinearGradient(
                                begin: FractionalOffset.bottomCenter,
                                end: FractionalOffset.topCenter,
                                stops: const [
                                  0.4,
                                  2,
                                ],
                                colors: [
                                  Color.fromARGB(255, 15, 14, 14),
                                  Colors.black.withOpacity(0.000001)
                                ])),
                      )),
                  // Positioned(bottom: 100, child: Text('ssssssssssss')),
                  Positioned(
                    right: 20,
                    left: 20,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width / 1.1,
                        color: Color.fromARGB(255, 32, 32, 32),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 200,
                                child: Text('${value.title}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                              const Icon(
                                Icons.bookmark_add,
                                color: Colors.white,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                                text: TextSpan(children: [
                              // TextSpan(
                              //     text: 'Avengers: Endgame',
                              //     style: TextStyle(
                              //         color: Colors.white,
                              //         fontSize: 20,
                              //         fontWeight: FontWeight.bold)),

                              TextSpan(
                                  text: '${value.tahun.toString()}',
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal)),
                              TextSpan(
                                  text: ' . ${value.genre}',
                                  // text: ' . ',
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal)),
                              TextSpan(
                                  text: ' . Rating  ${value.rate.toString()}',
                                  // text: ' . Rating  ',
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal)),
                            ])),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      color: Colors.white24,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://image.tmdb.org/t/p/original${value.path2}',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: SpinKitThreeBounce(
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),

                                      //  Image.network(
                                      //   'https://image.tmdb.org/t/p/original${value.path2}',
                                      //   //'',
                                      //   fit: BoxFit.cover,
                                      // ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 160,
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: '${value.productionCompanies_}',
                                          // text: '',
                                          style: const TextStyle(
                                            color: Colors.white60,
                                            fontSize: 15,
                                          )),
                                      TextSpan(
                                          text: '\n${value.negara}',
                                          //text: '\n',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ])),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                dragStartBehavior: DragStartBehavior.down,
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    backgroundColor: Colors.transparent,
                                    enableDrag: true,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white70,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: SingleChildScrollView(
                                          child: Wrap(
                                            children: [
                                              Consumer<Providers>(builder:
                                                  (context, value, child) {
                                                List<Result> data =
                                                    value.getVideos;

                                                return Column(
                                                  children: data
                                                      .map((e) => ListVidoe(
                                                          result_model: e))
                                                      .toList(),
                                                );
                                              })
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => PlayVideo(
                                  //               id_videos: widget.ids,
                                  //             )));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: Colors.white24,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(children: [
                                    // ignore: prefer_const_constructors
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    const Text('Watch Video',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white)),
                                  ]),
                                ),
                              )
                            ],
                          )
                        ]),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Synopsis',
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        LikeButton(
                          size: 30,
                          circleColor:
                              CircleColor(start: Colors.red, end: Colors.red),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Colors.red,
                            dotSecondaryColor: Colors.red,
                          ),
                          countPostion: CountPostion.bottom,
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.favorite,
                              color: isLiked ? Colors.red : Colors.grey,
                              size: 30,
                            );
                          },
                          likeCount: int.parse(count),

                          countBuilder: (likeCount, isLiked, text) {
                            count = '$likeCount';
                            // return Text(
                            //   '$count',
                            //   style: TextStyle(
                            //       color: isLiked ? Colors.red : Colors.grey),
                            // );
                          },

                          //  onTap: (bool isLiked) {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        // 'Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga',
                        '${value.overview}',
                        // '',
                        style: GoogleFonts.poppins().copyWith(
                          color: Colors.white60,
                        )),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          );
        },
      ))),
    );
  }
}

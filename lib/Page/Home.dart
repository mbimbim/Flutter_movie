import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tes_movie/Card/BackroundSlide.dart';
import 'package:tes_movie/Card/Riview%20Popular.dart';
import 'package:tes_movie/Card/popular.dart';
import 'package:tes_movie/Models/Model_Popularity.dart';
import 'package:tes_movie/Widget/Widget.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Provider/Provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required String title}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = "";

  // final urlImages = [
  //   'assetst/Images/img_dashboard.png',
  //   'assetst/Images/img_dashboard.png',
  //   'assetst/Images/img_dashboard.png',
  //   'assetst/Images/img_dashboard.png',
  // ];

  int currentIndex3 = 0;
  final provider = Providers();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // provider.getPopularity();
    Provider.of<Providers>(context, listen: false).getPopularity();
    Provider.of<Providers>(context, listen: false).getTopRate();
  }

  @override
  Widget build(BuildContext context) {
    // provider.getPopularity();
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 430,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child:
                        //  FutureBuilder<List<Model_Popularity>>(
                        //   future: provider.getPopularity(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.hasData) {
                        //       List<Model_Popularity> list = snapshot.data!;
                        //       return Consumer<Providers>(
                        //           builder: ((context, value, child) {
                        //         print('listtt ${value.listPrpularity.length}');
                        //         return CarouselSlider(
                        //           options: CarouselOptions(
                        //             autoPlay: true,
                        //             aspectRatio: 1.0,
                        //             enlargeCenterPage: true,
                        //             viewportFraction: 0.8,
                        //             autoPlayInterval: const Duration(seconds: 3),

                        //             height: 430,
                        //             //autoPlay: true,
                        //             //  aspectRatio: 1.0,
                        //             // enlargeCenterPage: true,
                        //             // viewportFraction: 0.8,
                        //             onPageChanged: (index, reason) =>
                        //                 Fluttertoast.showToast(msg: '$index'),
                        //             //  value.activeindex = index,

                        //             initialPage: 0,

                        //             autoPlayAnimationDuration:
                        //                 const Duration(milliseconds: 800),
                        //             autoPlayCurve: Curves.fastOutSlowIn,
                        //             pauseAutoPlayOnTouch: true,
                        //           ),
                        //           items: list
                        //               .map((item) => Image.network(
                        //                   'https://image.tmdb.org/t/p/original${item.backround_img}',
                        //                   fit: BoxFit.cover))
                        //               .toList(),
                        //         );
                        //       }));
                        //     } else {
                        //       //    Fluttertoast.showToast(msg: "Kosong");
                        //       return Container();
                        //     }

                        //   return
                        Consumer<Providers>(builder: ((context, value, child) {
                      return CarouselSlider.builder(
                        options: CarouselOptions(
                            height: 430,
                            autoPlay: false,
                            aspectRatio: 2,
                            enlargeCenterPage: true,
                            viewportFraction: 1.0,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(seconds: 2),
                            autoPlayInterval: Duration(seconds: 25),
                            onPageChanged: (index, reason) =>
                                //  Fluttertoast.showToast(msg: '$index')
                                //value.activeindex = index,
                                value.nextActiveIndex(index)),
                        itemCount: value.listPrpularity.length,
                        itemBuilder: ((context, index, realIndex) {
                          print('valueee ' +
                              value.listPrpularity.length.toString());
                          return Container(
                              child: value.listPrpularity.isEmpty
                                  ? Container()
                                  : BackroundSlide(
                                      backround_img: value
                                          .listPrpularity[index].backround_img,
                                      poster_path: value
                                          .listPrpularity[index].poster_path,
                                      original_title: value
                                          .listPrpularity[index].original_title)
                              // Image.network(
                              //     'https://image.tmdb.org/t/p/original' +
                              //         value.listPrpularity[index]
                              //             .backround_img,
                              //     fit: BoxFit.cover,
                              //   ),
                              );
                        }),
                      );
                    }))
                    //  },
                    // )
                    ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 129,
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
                            Colors.black,
                            Colors.black.withOpacity(0.000001)
                          ])),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "My List",
                            style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                color: Colors.white),
                          ),
                          Text("Dicover",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 155,
                            height: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xFF333333)),
                            child: const Center(
                              child: Text("+ Wishlist",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                            ),
                          ),
                          Container(
                            width: 155,
                            height: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xFFF2C94C)),
                            child: const Center(
                              child: Text("Details",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 20,
                      ),
                      Consumer<Providers>(
                        builder: ((context, value, child) =>
                            AnimatedSmoothIndicator(
                              activeIndex: value.activeindex,
                              count: value.listPrpularity.length,
                              // ignore: prefer_const_constructors
                              effect: WormEffect(
                                activeDotColor: Colors.blue,
                                dotColor: Colors.white,
                                dotHeight: 10,
                                dotWidth: 10,
                                radius: 10,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Marvel Studios",
                    style: GoogleFonts.poppins().copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    "See more",
                    style: GoogleFonts.poppins().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0XFFF2C94C)),
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(15),
                height: 200,
                child: Consumer<Providers>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.listPrpularity.length,
                      itemBuilder: (context, index) {
                        return Popular(
                          id: value.listPrpularity[index].id,
                          img: 'https://image.tmdb.org/t/p/original' +
                              value.listPrpularity[index].poster_path,
                          name: value.listPrpularity[index].title,
                        );
                      },
                    );
                  },
                )
                // ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: [
                //     Popular(img: 'assetst/Images/imglist1.png', name: 'Hawlake'),
                //     const SizedBox(
                //       width: 15,
                //     ),
                //     Popular(
                //         img: 'assetst/Images/imglist2.png',
                //         name: 'Thor : Love And Thunder'),
                //     const SizedBox(
                //       width: 15,
                //     ),
                //     Popular(
                //         img: 'assetst/Images/imglist3.png',
                //         name: 'War for the Planet of the Apes'),
                //     const SizedBox(
                //       width: 15,
                //     ),
                //     Popular(img: 'assetst/Images/imglist4.png', name: 'Hawlake'),
                //     const SizedBox(
                //       width: 15,
                //     ),
                //   ],
                // ),
                ),
            Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                height: 200,
                child: Consumer<Providers>(builder: ((context, value, child) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.listTopRate.length,
                      itemBuilder: ((context, index) {
                        return RvPopular(
                            id: value.listTopRate[index].id.toString(),
                            img: value.listTopRate[index].posterPath,
                            name: value.listTopRate[index].title,
                            rate: value.listTopRate[index].voteAverage);
                      }));
                }))
                // ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: [
                //     RvPopular(
                //       img: 'assetst/Images/Rvimglist1.png',
                //       name: 'Hlake',
                //       rate: 4.5,
                //     ),
                //     const SizedBox(
                //       width: 15,
                //     ),
                //     RvPopular(
                //         rate: 4.5,
                //         img: 'assetst/Images/Rvimglist2.png',
                //         name: 'ssd'),
                //     const SizedBox(
                //       width: 15,
                //     ),
                //     RvPopular(
                //         rate: 4.5,
                //         img: 'assetst/Images/Rvimglist4.png',
                //         name: 'Waca'),
                //     const SizedBox(
                //       width: 15,
                //     ),
                //     RvPopular(
                //         rate: 4.5,
                //         img: 'assetst/Images/Rvimglist5.png',
                //         name: 'asd'),
                //     const SizedBox(
                //       width: 15,
                //     ),
                //   ],
                // ),
                ),
            CardPromo(),
            const SizedBox(
              height: 16,
            ),
            Tombol_cek_status(),
            const SizedBox(
              height: 20,
            )
          ]),
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //   Provider.of<Providers>(context, listen: false).getPopularity();
        // }),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentIndex3 = index;
            });
          },
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex3,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset('assetst/Images/home.png',
                  height: 40, width: 25, color: Colors.white),
              activeIcon: Image.asset('assetst/Images/home_fill.png',
                  height: 40, width: 25, color: Colors.yellow),
              label: 'Home Bima',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset('assetst/Images/reel.png',
                  height: 40, width: 25, color: Colors.white),
              activeIcon: Image.asset('assetst/Images/reel_fill.png',
                  height: 40, width: 25, color: Colors.yellow),
              label: 'Reels',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset('assetst/Images/gallery.png',
                  height: 40, width: 25, color: Colors.white),
              activeIcon: Image.asset('assetst/Images/gallery_fill.png',
                  height: 40, width: 25, color: Colors.yellow),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset('assetst/Images/heart.png',
                  height: 40, width: 25, color: Colors.white),
              activeIcon: Image.asset('assetst/Images/heart_fill.png',
                  height: 40, width: 25, color: Colors.yellow),
              label: 'Activity',
            ),
          ],
        ));
  }

  Widget CardPromo() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assetst/Images/imgPromo.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Black friday is here!",
            style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra sociis pulvinar auctor nibh nibh iaculis id.",
              style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.white))
        ],
      ),
    );
  }

  Widget Tombol_cek_status() {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Center(child: Text("Terimakasih Buat Kalian")),
                content: Wrap(
                  children: [
                    Column(children: [
                      Text(
                          'Create By : Bima Pratama \nPendidikan : Universutas Harapan Medan\nJurusan : Sistem Informasi\n\nDemo Aplikasi Movie')
                    ])
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0XFFF2C94C),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Check Details",
            style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

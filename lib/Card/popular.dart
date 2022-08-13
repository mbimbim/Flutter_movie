import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tes_movie/Page/Detail_Movie.dart';

import '../Provider/Provider.dart';

class Popular extends StatelessWidget {
  String img;
  int id;
  String name;

  Popular({Key? key, required this.img, required this.name, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, '/detail', arguments: img);

            // Provider.of<Providers>(context, listen: false).clear();
            Provider.of<Providers>(context, listen: false)
                .getVideoLink(id.toString());
            Provider.of<Providers>(context, listen: false)
                .getDetail(id.toString());
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Detail_page(ids: id.toString())));
            print('idimg ' + id.toString());
          },
          child: Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            width: 120,
            height: 160,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/original' + img,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // img.isEmpty
              //     ? Center(
              //         child: CircularProgressIndicator(),
              //       )
              //     : Image.network(img, fit: BoxFit.cover)
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 120,
          child: Center(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

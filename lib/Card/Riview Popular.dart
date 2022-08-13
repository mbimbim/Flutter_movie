import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Page/Detail_Movie.dart';
import '../Provider/Provider.dart';

class RvPopular extends StatelessWidget {
  String img;
  String id;
  String name;
  double rate;

  RvPopular({
    Key? key,
    required this.img,
    required this.name,
    required this.rate,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Providers>(context, listen: false)
            .getVideoLink(id.toString());
        Provider.of<Providers>(context, listen: false).getDetail(id.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    Detail_page(ids: id.toString())));
      },
      child: Stack(
        children: [
          Container(
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
          SizedBox(height: 10),
          Positioned(
            bottom: 45,
            left: 10,
            child: Container(
              width: 80,
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 45,
            right: 10,
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(rate.toString(),
                    style: GoogleFonts.poppins().copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

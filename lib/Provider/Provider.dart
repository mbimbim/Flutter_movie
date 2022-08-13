import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tes_movie/Models/Model_Videos.dart';

import '../Models/Model_Detail.dart';
import '../Models/Model_Popularity.dart';
import 'package:http/http.dart' as http;

import '../Models/Model_TopRate.dart';
import '../Page/Detail_Movie.dart';

class Providers extends ChangeNotifier {
  List<Model_Popularity> listPrpularity = [];
  List<Result_ModelToprate> listTopRate = [];
  List<Result_ModelToprate> getDetails = [];
  List<Result> getVideos = [];
  int activeindex = 0;
  var path = '';
  var title = '';
  String tahun = '';
  var genre = '';
  double rate = 0.0;
  var path2 = '';
  var overview = '';
  var productionCompanies_ = '';
  var negara = '';

  // List<Model_Popularity> get popular => listPrpularity;
  // set popular(List<Model_Popularity> popular) {
  //   listPrpularity = popular;
  //   notifyListeners();
  // }

  void nextActiveIndex(index) {
    activeindex = index;
    notifyListeners();
  }

  void clear() {
    path = '';
    title = '';
    tahun = '';
    genre = '';
    rate = 0.0;
    path2 = '';
    overview = '';
    productionCompanies_ = '';
    negara = '';

    notifyListeners();
  }

  Future<List<Model_Popularity>> getPopularity() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=0bdc72e416bdaf3386c89c511795fe9a&language=en-US&page=1');
    final response = await http.post(url);

    List result = json.decode(response.body)["results"];

    if (response.statusCode == 200) {
      print(result);
      listPrpularity = result.map((e) => Model_Popularity.fromJson(e)).toList();

      print('tess ' + listPrpularity.length.toString());

      // final List<Model_Popularity> popular = [];
      // for (var i = 0; i < resultList.length; i++) {
      //   popular.add(Model_Popularity(
      //     backround_img: resultList[i]['backdrop_path'],
      //     id: resultList[i]['id'],
      //     original_language: resultList[i]['original_language'],
      //     original_title: resultList[i]['original_title'],
      //     overview: resultList[i]['overview'],
      //     poster_path: resultList[i]['poster_path'],
      //     release_date: resultList[i]['release_date'],
      //     title: resultList[i]['title'],
      //     video: resultList[i]['video'],
      //     vote_average: resultList[i]['vote_average'],
      //     vote_count: resultList[i]['vote_count'],
      //   ));
      // }
      // return popular;
      notifyListeners();
      return listPrpularity;
    } else {
      notifyListeners();
      throw Exception('Failed to load data');
    }
  }

  Future<List<Result_ModelToprate>> getTopRate() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=0bdc72e416bdaf3386c89c511795fe9a&language=en-US&page=1');
    final response = await http.post(url);

    List result = json.decode(response.body)["results"];

    if (response.statusCode == 200) {
      print(result);
      listTopRate = result.map((e) => Result_ModelToprate.fromJson(e)).toList();

      print('tess ' + listTopRate.length.toString());

      // final List<Model_Popularity> popular = [];
      // for (var i = 0; i < resultList.length; i++) {
      //   popular.add(Model_Popularity(
      //     backround_img: resultList[i]['backdrop_path'],
      //     id: resultList[i]['id'],
      //     original_language: resultList[i]['original_language'],
      //     original_title: resultList[i]['original_title'],
      //     overview: resultList[i]['overview'],
      //     poster_path: resultList[i]['poster_path'],
      //     release_date: resultList[i]['release_date'],
      //     title: resultList[i]['title'],
      //     video: resultList[i]['video'],
      //     vote_average: resultList[i]['vote_average'],
      //     vote_count: resultList[i]['vote_count'],
      //   ));
      // }
      // return popular;
      notifyListeners();
      return listTopRate;
    } else {
      notifyListeners();
      throw Exception('Failed to load data');
    }
  }

  getDetail(String ids) async {
    final url = Uri.parse('https://api.themoviedb.org/3/movie/' +
        ids +
        '?api_key=0bdc72e416bdaf3386c89c511795fe9a&language=en-US');
    final response = await http.get(url);

    //print('getDetail_url ' + url.toString());
    print('getDetail ' + response.body);

    var hasilrespon = json.decode(response.body);

    if (response.statusCode == 200) {
      var getDetails = GetDetail.fromJson(hasilrespon);

      //       var path = '';
      // var title = '';
      // var tahun = '';
      // var genre = '';
      // var durasi = '';
      // var path2  = '';
      // var overview = '';

      final DateFormat formatter = DateFormat('yyyy-MM-dd');

      final String formatted = formatter.format(getDetails.releaseDate);

      path = getDetails.backdropPath;
      title = getDetails.title;
      tahun = formatted;
      genre = getDetails.genres[0].name;
      rate = getDetails.voteAverage;
      path2 = getDetails.posterPath;
      overview = getDetails.overview;
      productionCompanies_ = getDetails.productionCompanies[0].name;
      negara = getDetails.productionCountries[0].name;

      print('getDetail_2 ' + path);
      print('getDetail_2 ' + title);
      print('getDetail_2 ' + tahun);
      print('getDetail_2 ' + genre.toString());
      print('getDetail_2 ' + rate.toString());
      print('getDetail_2 ' + path2);
      //print('getDetail_2 ' + overview);
      print('getDetail_2 ' + productionCompanies_.toString());
      print('getDetail_2 ' + negara.toString());

      notifyListeners();
    }

    // void addPopular(Model_Popularity popular) {
    //   listPrpularity.add(popular);
    //   notifyListeners();
    // }
  }

  Future<List<Result>> getVideoLink(String id) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/videos?api_key=0bdc72e416bdaf3386c89c511795fe9a&language=en-US');
    final response = await http.get(url);

    List result_s = json.decode(response.body)["results"];

    if (response.statusCode == 200) {
      print(result_s);
      getVideos = result_s.map((e) => Result.fromJson(e)).toList();

      print('videosss ' + result_s.toString());

      // final List<Model_Popularity> popular = [];
      // for (var i = 0; i < resultList.length; i++) {
      //   popular.add(Model_Popularity(
      //     backround_img: resultList[i]['backdrop_path'],
      //     id: resultList[i]['id'],
      //     original_language: resultList[i]['original_language'],
      //     original_title: resultList[i]['original_title'],
      //     overview: resultList[i]['overview'],
      //     poster_path: resultList[i]['poster_path'],
      //     release_date: resultList[i]['release_date'],
      //     title: resultList[i]['title'],
      //     video: resultList[i]['video'],
      //     vote_average: resultList[i]['vote_average'],
      //     vote_count: resultList[i]['vote_count'],
      //   ));
      // }
      // return popular;
      notifyListeners();
      return getVideos;
    } else {
      notifyListeners();
      throw Exception('Failed to load data');
    }
  }
}

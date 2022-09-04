import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/model/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  MovieModel? movieModel;
  List<Movies> moviesList = [];

  bool get movieData => movieModel != null;

  List<Movies> searchMovieByGen(String gen) {
    moviesList.clear();
    bool flag = false;
    for (var movie in movieModel!.data!.movies!) {
      for (var gens in movie.genres!) {
        if (gens == gen) {
          flag = true;
          break;
        }
      }
      if (flag) {
        moviesList.add(movie);
        flag = false;
      }
    }
    //print('movie List ${moviesList.length}');
    return moviesList;
    // }
  }

  List<Movies> getAllMovies() {
    moviesList.clear();
    for (var movie in movieModel!.data!.movies!) {
      moviesList.add(movie);
    }
    print('movie List ${moviesList.length}');
    return moviesList;
  }

  void getMovieApiData() async {
    final url = Uri.parse('https://yts.mx/api/v2/list_movies.json');

    try {
      final response = await get(url);
      final map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        movieModel = MovieModel.fromJson(map);
        //print(movieModel!.data!.movies!.length);
        getAllMovies();
        notifyListeners();
      } else {
        print('can not fetch url');
      }
    } catch (err) {
      rethrow;
    }
  }

  List<Movies> searchMovieByMovieName(String movieName) {
    moviesList.clear();

    for (var movie in movieModel!.data!.movies!) {
      if (movie.title!.toUpperCase() == movieName.toUpperCase()) {
        moviesList.add(movie);
      }
    }
    //print('movie List ${moviesList.length}');
    return moviesList;
    // }
  }
}

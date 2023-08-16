
import 'package:mitt_assignment/Model/movie_model.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../Utils/constants.dart';

final tmdbWithCustomLogs = TMDB(
  ApiKeys(apiKey, readAccessToken),
  logConfig: const ConfigLogger(
    showLogs: true,
    showErrorLogs: true,
  ),
);

Future<List<MovieModel>> getData() async {
  final response = await tmdbWithCustomLogs.v3.movies.getTopRated();
  List<MovieModel> list = [];
  for (var value in response['results']) {
    list.add(MovieModel.fromMap(value));
  }
  final movies = list;
  return movies;
}
 Future<List<MovieModel>> getSingleData(String movieName) async {
    final response = await tmdbWithCustomLogs.v3.search.queryMovies(movieName);
    List<MovieModel> list = [];
    for(var value in response['results']){
      list.add(MovieModel.fromJson(value));
    }
    final searchMovie = list;
    
    return searchMovie;
  }
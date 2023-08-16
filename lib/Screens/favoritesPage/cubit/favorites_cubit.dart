import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mitt_assignment/Model/movie_model.dart';

import '../../../Repositories/data.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  void addMovie(MovieModel movie){
    favoriteMovies.add(movie);
    emit(FavoritesShowingState(favoriteMovies: favoriteMovies));
  }
  void removeMovie(MovieModel movie){
    favoriteMovies.remove(movie);
    emit(FavoritesShowingState(favoriteMovies: favoriteMovies));
  }
}

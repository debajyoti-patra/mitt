part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

// ignore: must_be_immutable
class FavoritesInitial extends FavoritesState {}

class FavoritesShowingState extends FavoritesState {
   List<MovieModel> favoriteMovies;
  FavoritesShowingState({required this.favoriteMovies});
}



import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mitt_assignment/Model/movie_model.dart';
import 'package:mitt_assignment/Repositories/data.dart';
import 'package:mitt_assignment/Repositories/services.dart';



part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getPopular();
  }
 
  Future<void> getPopular() async {
    emit(HomeLodingState());
    fetchMovies = await getData();
    emit(HomeLodedState(movies:fetchMovies),);
  }
  void addMovie(MovieModel movie){
    emit(HomeLodingState());
    if(!favoriteMovies.contains(movie)){
      favoriteMovies.add(movie);
      final current = fetchMovies.firstWhere((element) => element.id == movie.id);
      fetchMovies.remove(current);
      fetchMovies.add(movie);
    }
   print('event');
   emit(HomeLodedState(movies:fetchMovies),);
   print('eeene');
  }
  void removeMovie(MovieModel movie){
    favoriteMovies.remove(movie);
    emit(HomeLodedState(movies:favoriteMovies),);
  }
  void update(HomeLodedState newState){
    emit(newState);
  }
}

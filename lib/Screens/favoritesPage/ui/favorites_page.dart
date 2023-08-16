import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitt_assignment/Model/movie_model.dart';
import 'package:mitt_assignment/Screens/Widgets/movies_tile.dart';
import 'package:mitt_assignment/Screens/favoritesPage/cubit/favorites_cubit.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});
  List<MovieModel> resultMovies = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
        centerTitle: true,
      ),
      // body: BlocConsumer<FavoritesCubit, FavoritesState>(
      //   listener: (context, state) {
      //     // TODO: implement listener
      //   },
      //   builder: (context, state) {
      //     if(state is FavoritesInitial){
      //        return MoviesTile(resultMovies: resultMovies);
      //     }
      //    else{
      //     return Container();
      //    }
      //   },
      // ),
    );
  }
}

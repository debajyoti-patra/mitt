import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitt_assignment/Screens/Widgets/movies_tile.dart';
import 'package:mitt_assignment/Screens/favoritesPage/cubit/favorites_cubit.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
        centerTitle: true,
      ),
      body: BlocConsumer<FavoritesCubit, FavoritesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is FavoritesInitial) {
            return MoviesTile(state: state);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

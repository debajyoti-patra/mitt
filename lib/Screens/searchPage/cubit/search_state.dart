part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLodingState extends SearchState {}

// ignore: must_be_immutable
class SearchLodedState extends SearchState {
  List<MovieModel> movies;
  SearchLodedState({required this.movies});
}
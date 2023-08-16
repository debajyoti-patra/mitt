import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mitt_assignment/Repositories/data.dart';

import '../../../Model/movie_model.dart';
import '../../../Repositories/services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  Future<void> getSearchMovie(String value)async{
    emit(SearchLodingState());
    print('djdjdj');
    searchMovies = await getSingleData(value);
    emit(SearchLodedState(movies: searchMovies),);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitt_assignment/Screens/searchPage/widgets/search_bar.dart';
import '../../../Utils/constants.dart';
import '../../Widgets/movies_tile.dart';
import '../cubit/search_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
        centerTitle: true,
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SearchInitial) {
            return const CustomSearchBar();
          } else if (state is SearchLodingState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (state is SearchLodedState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Container(
                  //   height: 45.h,
                  //   width: double.maxFinite,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(30),
                  //     color: Colors.white,
                  //   ),
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   margin: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.search,
                  //         color: kScaffoldBackgroundColor,
                  //       ),
                  //       SizedBox(
                  //         width: 10.w,
                  //       ),
                  //       SizedBox(
                  //         width: 200.w,
                  //         child: TextFormField(
                  //           // controller: searchController,
                  //           onFieldSubmitted: (value) {
                  //             context.read<SearchCubit>().getSearchMovie(value);
                  //           },
                  //           style: TextStyle(
                  //               decorationThickness: 0,
                  //               color: kScaffoldBackgroundColor),
                  //           decoration: const InputDecoration(
                  //             border: InputBorder.none,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const CustomSearchBar(),
                  SizedBox(
                    height: 10.h,
                  ),
                  // SizedBox(
                  //   height: height * 0.80.h,
                  //   child: MoviesTile(resultMovies: state.movies,vheight: 145,),
                  // ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
    
  }
}


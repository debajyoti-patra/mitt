import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitt_assignment/Screens/Widgets/custom_text.dart';
import 'package:mitt_assignment/Screens/favoritesPage/cubit/favorites_cubit.dart';
import 'package:mitt_assignment/Screens/favoritesPage/ui/favorites_page.dart';
import 'package:mitt_assignment/Screens/homePage/cubit/home_cubit.dart';
import 'package:mitt_assignment/Screens/searchPage/ui/search_page.dart';
import '../../../Utils/constants.dart';
import '../../searchPage/cubit/search_cubit.dart';
import '../../Widgets/movies_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  HomeCubit cubit = HomeCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => FavoritesCubit(),
                      child: FavoritesPage(),
                    ),
                  ),
                );
              },
              child: const ListTile(
                leading: Icon(Icons.favorite),
                title: CustomText(
                  text: 'Favourites',
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Popular Movies'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SearchCubit(),
                      child: SearchPage(),
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.search,
                size: 30.w,
              ),
            ),
          ),
        ],
        leading: SizedBox(
          width: 100.w,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: InkWell(
              onTap: () {
                _key.currentState!.openDrawer();
              },
              child: Icon(
                Icons.menu,
                size: 30.w,
              ),
            ),
          ),
        ),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        bloc: cubit,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeLodingState) {
            print('state');
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (state is HomeLodedState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.90.h,
                    child: MoviesTile(resultMovies: state.movies),
                  ),
                ],
              ),
            );
            
          } 
          else if (state is HomeFavoriteAddedState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.90.h,
                    child: MoviesTile(resultMovies: state.movies),
                  ),
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

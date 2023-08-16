import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitt_assignment/Model/movie_model.dart';
import 'package:mitt_assignment/Screens/descriptionPage/ui/description_page.dart';
import 'package:mitt_assignment/Screens/favoritesPage/cubit/favorites_cubit.dart';
import 'package:mitt_assignment/Screens/homePage/cubit/home_cubit.dart';
import 'package:mitt_assignment/Utils/colors.dart';
import 'package:mitt_assignment/Utils/constants.dart';
import 'custom_text.dart';

class MoviesTile extends StatelessWidget {
  const MoviesTile({
    super.key,
    required this.resultMovies,
    this.vheight = 153,
  });
  final List<MovieModel> resultMovies;
  final double? vheight;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        if(current is HomeLodedState){
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(0),
          itemCount: resultMovies.length,
          itemBuilder: (context, index) {
            final current = resultMovies[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DescriptionPage(currentMovie: current),
                    ));
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 7.h, bottom: 7.h),
                    height: height * 0.153.h,
                    width: width * 1.w,
                    child: Row(
                      children: [
                        Container(
                          height: height * vheight!.h,
                          width: width * 0.35.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: current.backdropPath != null
                                    ? NetworkImage(
                                        imageUrl + current.posterPath!)
                                    : const NetworkImage(
                                        'https://forums.autodesk.com/t5/image/serverpage/image-id/125177iE9EFA6CFE2DD73AE/image-size/medium?v=mpbl-1&px=-1'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width * 0.45.w,
                                child: CustomText(
                                  text: current.title ?? '',
                                  fontSize: 20,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * 0.35.w,
                                    child: CustomText(
                                        text: '⭐ ${current.voteAverage ?? 0}'),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    width: width * 0.47.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: width * 0.35.w,
                                          child: CustomText(
                                            text:
                                                'Release Year - ${current.releaseDate?.substring(0, 4)}',
                                            maxLines: 3,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            context.read<HomeCubit>().addMovie(current.copyWith(isChecked: true));
                                          },
                                          child: current.isChecked ?? false
                                              ? Icon(Icons.favorite)
                                              : Icon(Icons
                                                  .favorite_border_outlined),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    color: kLight,
                    height: 0.35.h,
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

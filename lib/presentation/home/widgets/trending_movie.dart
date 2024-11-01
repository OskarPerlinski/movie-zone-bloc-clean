import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/bloc/movies/movies_display_cubit.dart';
import 'package:movie_zone/common/bloc/movies/movies_display_state.dart';
import 'package:movie_zone/common/helper/image/image_display_helper.dart';
import 'package:movie_zone/domain/movie/usecases/trending_movie.dart';
import 'package:movie_zone/service_locator.dart';

class TrendingMovie extends StatelessWidget {
  const TrendingMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesDisplayCubit(useCase: sl<TrendingMovieUseCase>())
            ..displayMovies(),
      child: BlocBuilder<MoviesDisplayCubit, MoviesDisplayState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MovieLoaded) {
            final movies = state.movies;

            final imageUrls = movies
                .where((movie) => movie.views >= 5000)
                .map(
                  (movie) =>
                      ImageDisplayHelper.generateProductImageURL(movie.image),
                )
                .toList();

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'POPULAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FanCarouselImageSlider.sliderType1(
                  imagesLink: imageUrls,
                  isAssets: false,
                  autoPlay: false,
                  sliderHeight: 400,
                  showIndicator: true,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

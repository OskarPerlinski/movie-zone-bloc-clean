import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/bloc/movies/movies_display_cubit.dart';
import 'package:movie_zone/common/bloc/movies/movies_display_state.dart';
import 'package:movie_zone/common/widgets/movie/movie_card.dart';
import 'package:movie_zone/domain/movie/entity/movie.dart';
import 'package:movie_zone/domain/movie/usecases/playing_now.dart';
import 'package:movie_zone/service_locator.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesDisplayCubit(useCase: sl<PlayingNowUseCase>())..displayMovies(),
      child: BlocBuilder<MoviesDisplayCubit, MoviesDisplayState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MovieLoaded) {
            final List<MovieModelEntity> movies = state.movies;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'NOW PLAYING',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10
                  ),
                  child: SizedBox(
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MovieCard(
                          movieModelEntity: movies[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: movies.length,
                    ),
                  ),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

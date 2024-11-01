import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/presentation/movie_detail/bloc/trailer_display_cubit.dart';
import 'package:movie_zone/presentation/movie_detail/bloc/trailer_display_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerWidget extends StatelessWidget {
  final String trailerUrl;

  const TrailerWidget({super.key, required this.trailerUrl});

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(trailerUrl) ?? '';

    return BlocProvider(
      create: (context) => TrailerDisplayCubit()..getMovieTrailer(videoId),
      child: BlocBuilder<TrailerDisplayCubit, TrailerDisplayState>(
        builder: (context, state) {
          if (state is TrailerLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TrailerLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: YoutubePlayer(
                controller: state.youtubePlayerController,
              ),
            );
          } else if (state is FailureLoadTrailer) {
            return Center(
              child: Text(
                "Error: ${state.errorMessgae},",
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

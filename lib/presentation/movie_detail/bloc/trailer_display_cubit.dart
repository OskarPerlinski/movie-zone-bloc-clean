import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/presentation/movie_detail/bloc/trailer_display_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerDisplayCubit extends Cubit<TrailerDisplayState> {
  TrailerDisplayCubit() : super(TrailerLoading());

  void getMovieTrailer(String videoId) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );

    emit(
      TrailerLoaded(
        youtubePlayerController: controller,
      ),
    );
  }
}

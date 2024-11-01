import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerDisplayState {}

class TrailerLoading extends TrailerDisplayState {}

class TrailerLoaded extends TrailerDisplayState {
  final YoutubePlayerController youtubePlayerController;

  TrailerLoaded({required this.youtubePlayerController});
}

class FailureLoadTrailer extends TrailerDisplayState {
  final String errorMessgae;
  FailureLoadTrailer({required this.errorMessgae, required errorMessage});
}

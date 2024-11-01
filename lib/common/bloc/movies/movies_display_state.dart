import 'package:movie_zone/domain/movie/entity/movie.dart';

abstract class MoviesDisplayState {}

class MoviesInitialState extends MoviesDisplayState{}

class MovieLoading extends MoviesDisplayState{}

class MovieLoaded extends MoviesDisplayState{
  final List<MovieModelEntity> movies;
  MovieLoaded({required this.movies});
}

class LoadMovieFailure extends MoviesDisplayState{}
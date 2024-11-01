import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:movie_zone/domain/movie/repository/movie.dart';
import 'package:movie_zone/service_locator.dart';

class PlayingNowUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<MovieRepository>().getNowPlayingMovies();
  }
  
}
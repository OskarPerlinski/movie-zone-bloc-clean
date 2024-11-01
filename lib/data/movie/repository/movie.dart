import 'package:dartz/dartz.dart';
import 'package:movie_zone/data/movie/models/movie.dart';
import 'package:movie_zone/data/movie/source/movie_firebase_service.dart';
import 'package:movie_zone/domain/movie/repository/movie.dart';
import 'package:movie_zone/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieFirebaseService>().getTrendingMovies();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map(
                (e) => MovieModel.fromMap(e).toEntity(),
              )
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await sl<MovieFirebaseService>().getNowPlayingMovies();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map(
                (e) => MovieModel.fromMap(e).toEntity(),
              )
              .toList(),
        );
      },
    );
  }
}

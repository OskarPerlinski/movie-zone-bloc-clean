import 'package:get_it/get_it.dart';
import 'package:movie_zone/data/auth/repository/auth.dart';
import 'package:movie_zone/data/auth/source/auth_firebase_service.dart';
import 'package:movie_zone/data/movie/repository/movie.dart';
import 'package:movie_zone/data/movie/source/movie_firebase_service.dart';
import 'package:movie_zone/domain/auth/repository/auth.dart';
import 'package:movie_zone/domain/auth/usecases/send_password_reset_email.dart';
import 'package:movie_zone/domain/auth/usecases/signin.dart';
import 'package:movie_zone/domain/auth/usecases/signup.dart';
import 'package:movie_zone/domain/movie/repository/movie.dart';
import 'package:movie_zone/domain/movie/usecases/playing_now.dart';
import 'package:movie_zone/domain/movie/usecases/trending_movie.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  //SERVICES
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<MovieFirebaseService>(
    MovieFirebaseServiceImpl()
  );

  //REPOSITORIES
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<MovieRepository>(
    MovieRepositoryImpl()
  );

  //USECASES
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );

  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase()
  );

   sl.registerSingleton<TrendingMovieUseCase>(
    TrendingMovieUseCase()
  );

  sl.registerSingleton<PlayingNowUseCase>(
    PlayingNowUseCase()
  );



}
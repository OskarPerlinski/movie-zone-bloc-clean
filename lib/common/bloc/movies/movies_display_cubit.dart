import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/bloc/movies/movies_display_state.dart';
import 'package:movie_zone/core/usecases/usecase.dart';

class MoviesDisplayCubit extends Cubit<MoviesDisplayState> {
  final UseCase useCase;
  MoviesDisplayCubit({required this.useCase}) : super(MoviesInitialState());

  void displayMovies({dynamic params}) async {
    emit(
      MovieLoading(),
    );
    var returnedData = await useCase.call(params: params);
    returnedData.fold(
      (error) {
        emit(
          LoadMovieFailure(),
        );
      },
      (data) {
        emit(
          MovieLoaded(movies: data),
        );
      },
    );
  }
}

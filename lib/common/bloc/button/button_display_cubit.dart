import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_zone/common/bloc/button/button_display_state.dart';
import 'package:movie_zone/core/usecases/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required UseCase usecases}) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecases.call(params: params);

      returnedData.fold(
        (error) {
          emit(ButtonFailureState(errorMessage: error));
        },
        (data) {
          emit(ButtonLoadedState());
        },
      );
    } catch (e) {
      emit(
        ButtonFailureState(errorMessage: e.toString()),
      );
    }
  }
}
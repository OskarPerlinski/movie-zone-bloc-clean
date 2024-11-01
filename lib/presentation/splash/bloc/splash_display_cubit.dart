import 'package:bloc/bloc.dart';
import 'package:movie_zone/presentation/splash/bloc/splash_display_state.dart';

class SplashDisplayCubit extends Cubit<SplashDisplayState> {
  SplashDisplayCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    emit(
      UnAuthenticated()
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/config/assests/app_image.dart';
import 'package:movie_zone/presentation/auth/pages/sign_in.dart';
import 'package:movie_zone/presentation/splash/bloc/splash_display_cubit.dart';
import 'package:movie_zone/presentation/splash/bloc/splash_display_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashDisplayCubit, SplashDisplayState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignInPage(),
            ),
          );
        }
      },
      child: Image.asset(
        AppImage.backgorund,
      ),
    );
  }
}

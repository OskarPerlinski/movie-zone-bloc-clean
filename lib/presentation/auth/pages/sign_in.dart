import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/bloc/button/button_display_cubit.dart';
import 'package:movie_zone/common/bloc/button/button_display_state.dart';
import 'package:movie_zone/common/widgets/appbar/basic_appbar.dart';
import 'package:movie_zone/common/widgets/button/basic_reactive_button.dart';
import 'package:movie_zone/data/auth/models/user_signin_req.dart';
import 'package:movie_zone/domain/auth/usecases/signin.dart';
import 'package:movie_zone/presentation/auth/pages/forgot_password.dart';
import 'package:movie_zone/presentation/auth/pages/sign_up.dart';
import 'package:movie_zone/presentation/home/pages/home.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _emialCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
              if (state is ButtonLoadedState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              }
            },
            child: Column(
              children: [
                _signinText(),
                const SizedBox(height: 30),
                _emailField(),
                const SizedBox(height: 20),
                _passwordField(),
                const SizedBox(height: 50),
                _signinButton(),
                const SizedBox(height: 20),
                _signup(context),
                const SizedBox(height: 100),
                _forgotPassword(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Padding(
      padding: EdgeInsets.only(top: 30),
      child: Center(
        child: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          TextField(
            controller: _emialCon,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              fillColor: Colors.grey[800],
              filled: true,
              hintText: 'Email',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          TextField(
            controller: _passwordCon,
            obscureText: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              fillColor: Colors.grey[800],
              filled: true,
              hintText: 'Password',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signinButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Builder(
        builder: (context) {
          return BasicReactiveButton(
            onPressed: () {
              context.read<ButtonStateCubit>().execute(
                    usecases: SigninUseCase(),
                    params: UserSigninReq(
                      email: _emialCon.text,
                      password: _passwordCon.text,
                    ),
                  );
            },
            title: 'Sign in',
          );
        },
      ),
    );
  }

  Widget _signup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont have an account? ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpPage(),
              ),
            );
          },
          child: const Text(
            ' Sign Up',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  ForgotPasswordPage(),
          ),
        );
      },
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

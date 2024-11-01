import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/bloc/button/button_display_cubit.dart';
import 'package:movie_zone/common/bloc/button/button_display_state.dart';
import 'package:movie_zone/common/widgets/appbar/basic_appbar.dart';
import 'package:movie_zone/common/widgets/button/basic_reactive_button.dart';
import 'package:movie_zone/data/auth/models/user_creation_req.dart';
import 'package:movie_zone/domain/auth/usecases/signup.dart';
import 'package:movie_zone/presentation/auth/pages/sign_in.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
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
            },
            child: Column(
              children: [
                _signupText(),
                const SizedBox(height: 30),
                _firstNameField(),
                const SizedBox(height: 20),
                _lastNameField(),
                const SizedBox(height: 20),
                _emailField(),
                const SizedBox(height: 20),
                _passwordField(),
                const SizedBox(height: 50),
                _signupButton(),
                const SizedBox(height: 20),
                _signin(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signupText() {
    return const Padding(
      padding: EdgeInsets.only(top: 30),
      child: Center(
        child: Text(
          'Create Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _firstNameField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          TextField(
            style: const TextStyle(color: Colors.white),
            controller: _firstNameCon,
            decoration: InputDecoration(
              fillColor: Colors.grey[800],
              filled: true,
              hintText: 'First Name',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _lastNameField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          TextField(
            style: const TextStyle(color: Colors.white),
            controller: _lastNameCon,
            decoration: InputDecoration(
              fillColor: Colors.grey[800],
              filled: true,
              hintText: 'Last Name',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
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
            style: const TextStyle(color: Colors.white),
            controller: _emailCon,
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
            style: const TextStyle(color: Colors.white),
            controller: _passwordCon,
            obscureText: true,
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

  Widget _signupButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Builder(builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                  usecases: SignupUseCase(),
                  params: UserCreationReq(
                    firstName: _firstNameCon.text,
                    lastName: _lastNameCon.text,
                    email: _emailCon.text,
                    password: _passwordCon.text,
                  ),
                );
          },
          title: 'Sign up',
        );
      }),
    );
  }

  Widget _signin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignInPage(),
              ),
            );
          },
          child: const Text(
            ' Sign In',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

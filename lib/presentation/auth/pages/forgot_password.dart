import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/bloc/button/button_display_cubit.dart';
import 'package:movie_zone/common/bloc/button/button_display_state.dart';
import 'package:movie_zone/common/widgets/appbar/basic_appbar.dart';
import 'package:movie_zone/common/widgets/button/basic_reactive_button.dart';
import 'package:movie_zone/domain/auth/usecases/send_password_reset_email.dart';
import 'package:movie_zone/presentation/auth/pages/pasword_reset_email.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
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
                    builder: (context) => const PaswordResetEmailPage(),
                  ),
                );
              }
            },
            child: Column(
              children: [
                _forgotPasswordText(),
                _headerText(),
                const SizedBox(height: 40),
                _emailField(),
                const SizedBox(height: 50),
                _signinButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordText() {
    return const Padding(
      padding: EdgeInsets.only(top: 30),
      child: Center(
        child: Text(
          'Forgot Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _headerText() {
    return const Center(
      child: Text(
        'Please Enter Your Credential',
        style: TextStyle(
          color: Colors.grey,
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
            controller: _emailCon,
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

  Widget _signinButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Builder(builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                  usecases: SendPasswordResetEmailUseCase(),
                  params: _emailCon.text,
                );
          },
          title: 'Send Email',
        );
      }),
    );
  }
}

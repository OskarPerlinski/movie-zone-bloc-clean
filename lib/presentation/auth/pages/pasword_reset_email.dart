import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/common/widgets/button/basic_app_button.dart';
import 'package:movie_zone/core/config/assests/app_vectors.dart';
import 'package:movie_zone/presentation/auth/pages/sign_in.dart';

class PaswordResetEmailPage extends StatelessWidget {
  const PaswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _emailSendText(),
          const SizedBox(height: 20),
          _logoEmailSend(),
          const SizedBox(height: 100),
          _returnLogin(context),
        ],
      ),
    );
  }

  Widget _emailSendText() {
    return const Text(
      'We sent you Email',
      style: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _logoEmailSend() {
    return Center(
      child: SvgPicture.asset(
        AppVectors.emailSend,
        height: 150,
      ),
    );
  }

  Widget _returnLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: BasicAppButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignInPage(
                
              ),
            ),
          );
        },
        title: 'Return to login',
      ),
    );
  }
}

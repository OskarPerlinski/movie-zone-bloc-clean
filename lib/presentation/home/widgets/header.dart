import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/core/config/assests/app_vectors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Center(
        child: SvgPicture.asset(
          AppVectors.appLogo
        ),
      ),
    );
  }
}
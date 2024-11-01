import 'package:flutter/material.dart';
import 'package:movie_zone/presentation/home/widgets/header.dart';
import 'package:movie_zone/presentation/home/widgets/now_playing.dart';
import 'package:movie_zone/presentation/home/widgets/trending_movie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            TrendingMovie(),
            SizedBox(height: 50),
            NowPlaying(),
          ],
        ),
      ),
    );
  }
}
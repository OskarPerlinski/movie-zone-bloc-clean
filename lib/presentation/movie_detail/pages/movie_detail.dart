import 'package:flutter/material.dart';
import 'package:movie_zone/common/widgets/appbar/basic_appbar.dart';
import 'package:movie_zone/domain/movie/entity/movie.dart';
import 'package:movie_zone/presentation/movie_detail/widgets/description.dart';
import 'package:movie_zone/presentation/movie_detail/widgets/recommended.dart';
import 'package:movie_zone/presentation/movie_detail/widgets/starring.dart';
import 'package:movie_zone/presentation/movie_detail/widgets/title.dart';
import 'package:movie_zone/presentation/movie_detail/widgets/trailer.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModelEntity movieModelEntity;
  const MovieDetailPage({super.key, required this.movieModelEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: const BasicAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TrailerWidget(trailerUrl: movieModelEntity.trailerUrl),
            const SizedBox(height: 40),
            TitleWidget(modelEntity: movieModelEntity),
            const SizedBox(height: 40),
            DescriptionWidget(modelEntity: movieModelEntity),
            const SizedBox(height: 40),
            StarringWidget(modelEntity: movieModelEntity),
            const SizedBox(height: 40),
            const RecommendedWidget(),
          ],
        ),
      ),
    );
  }
}

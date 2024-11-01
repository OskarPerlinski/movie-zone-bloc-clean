import 'package:flutter/material.dart';
import 'package:movie_zone/common/helper/image/image_display_helper.dart';
import 'package:movie_zone/domain/movie/entity/movie.dart';
import 'package:movie_zone/presentation/movie_detail/pages/movie_detail.dart';

class MovieCard extends StatelessWidget {
  final MovieModelEntity movieModelEntity;

  const MovieCard({required this.movieModelEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MovieDetailPage(movieModelEntity: movieModelEntity),
          ),
        );
      },
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(
              ImageDisplayHelper.generateProductImageURL(
                  movieModelEntity.image),
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

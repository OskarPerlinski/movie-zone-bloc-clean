// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movie_zone/domain/movie/entity/movie.dart';

class MovieModel {
  final String image;
  final int views;
  final String trailerUrl;
  final String starring;
  final String description;
  final String title;
  final String raiting;

  MovieModel({
    required this.image,
    required this.views,
    required this.trailerUrl,
    required this.starring,
    required this.description,
    required this.title,
    required this.raiting,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      image: map['image'] as String,
      views: map['views'] as int,
      trailerUrl: map['trailerUrl'] as String,
      starring: map['starring'] as String,
      description: map['description'] as String,
      title: map['title'] as String,
      raiting: map['raiting'] as String,
    );
  }
}

extension MovieXModel on MovieModel {
  MovieModelEntity toEntity() {
    return MovieModelEntity(
      image: image,
      views: views,
      trailerUrl: trailerUrl,
      starring: starring,
      description: description,
      title: title,
      raiting: raiting,
    );
  }
}

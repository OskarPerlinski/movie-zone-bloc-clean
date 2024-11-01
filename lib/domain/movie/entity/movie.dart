class MovieModelEntity {
  final String image;
  final int views;
  final String trailerUrl;
  final String starring;
  final String description;
  final String title;
  final String raiting;


  MovieModelEntity({
    required this.image,
    required this.views,
    required this.trailerUrl,
    required this.starring,
    required this.description,
    required this.title,
    required this.raiting,
  });

  get key => null;
}
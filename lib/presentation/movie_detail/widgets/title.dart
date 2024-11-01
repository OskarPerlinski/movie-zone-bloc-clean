import 'package:flutter/material.dart';
import 'package:movie_zone/domain/movie/entity/movie.dart';

class TitleWidget extends StatelessWidget {
  final MovieModelEntity modelEntity;
  const TitleWidget({super.key, required this.modelEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            modelEntity.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.orange,
              ),
              const SizedBox(width: 5),
              Text(
                modelEntity.raiting,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

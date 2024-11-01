import 'package:flutter/material.dart';
import 'package:movie_zone/domain/movie/entity/movie.dart';

class DescriptionWidget extends StatelessWidget {
  final MovieModelEntity modelEntity;
  const DescriptionWidget({super.key, required this.modelEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DESCRIPTION',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            modelEntity.description,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}

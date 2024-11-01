import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class MovieFirebaseService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
}

class MovieFirebaseServiceImpl extends MovieFirebaseService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Movies')
          .where(
            'views',
            isGreaterThanOrEqualTo: 5000,
          )
          .get();
      return Right(
        returnedData.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Movies')
          .where(
            'views',
            isLessThan: 5000,
          )
          .get();
      return Right(
        returnedData.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return const Left('Please try again');
    }
  }
}

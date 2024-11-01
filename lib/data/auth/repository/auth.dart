import 'package:dartz/dartz.dart';
import 'package:movie_zone/data/auth/models/user_creation_req.dart';
import 'package:movie_zone/data/auth/models/user_signin_req.dart';
import 'package:movie_zone/data/auth/source/auth_firebase_service.dart';
import 'package:movie_zone/domain/auth/repository/auth.dart';
import 'package:movie_zone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> singup(UserCreationReq user) {
    return sl<AuthFirebaseService>().singup(user);
  }

  @override
  Future<Either> signin(UserSigninReq user) {
    return sl<AuthFirebaseService>().signin(user);
  }
  
  @override
  Future<Either> sendResetPasswordEmail(String email) {
    return sl<AuthFirebaseService>().sendResetPasswordEmail(email);
  }
}

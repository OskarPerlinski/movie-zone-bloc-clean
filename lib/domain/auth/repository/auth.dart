import 'package:dartz/dartz.dart';
import 'package:movie_zone/data/auth/models/user_creation_req.dart';
import 'package:movie_zone/data/auth/models/user_signin_req.dart';

abstract class AuthRepository{
  Future<Either> singup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> sendResetPasswordEmail(String email);
}
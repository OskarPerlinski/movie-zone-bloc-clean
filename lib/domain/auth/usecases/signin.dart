import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:movie_zone/data/auth/models/user_signin_req.dart';
import 'package:movie_zone/domain/auth/repository/auth.dart';
import 'package:movie_zone/service_locator.dart';

class SigninUseCase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}

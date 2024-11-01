import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:movie_zone/data/auth/models/user_creation_req.dart';
import 'package:movie_zone/domain/auth/repository/auth.dart';
import 'package:movie_zone/service_locator.dart';

class SignupUseCase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await sl<AuthRepository>().singup(params!);
  }
}

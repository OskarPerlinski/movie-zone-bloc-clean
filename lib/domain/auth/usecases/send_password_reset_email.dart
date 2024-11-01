import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:movie_zone/domain/auth/repository/auth.dart';
import 'package:movie_zone/service_locator.dart';

class SendPasswordResetEmailUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return sl<AuthRepository>().sendResetPasswordEmail(params!);
  }
}

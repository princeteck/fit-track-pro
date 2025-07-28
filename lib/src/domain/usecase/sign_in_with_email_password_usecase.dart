import 'package:dartz/dartz.dart';
import 'package:fittrack_pro/src/core/di/di.dart';
import 'package:injectable/injectable.dart';

import '../entities/auth_failure.dart';
import '../repositories/auth_repository.dart';
import 'base_usecase.dart';

@injectable
class SignInWithEmailAndPasswordUseCase
    implements UseCase<AuthResponse, SignInParams> {
  AuthRepository _repository;

  SignInWithEmailAndPasswordUseCase(this._repository) {
    _repository = locator<AuthRepository>();
  }

  @override
  Future<Either<AuthFailure, AuthResponse>> call(SignInParams params) async {
    return await _repository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});
}

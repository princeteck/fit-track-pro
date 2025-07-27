import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/auth_failure.dart';
import '../repositories/auth_repository.dart';
import 'base_usecase.dart';

@injectable
class SignUpWithEmailAndPasswordUseCase
    implements UseCase<AuthResponse, SignUpParams> {
  final AuthRepository _repository;

  SignUpWithEmailAndPasswordUseCase(this._repository);

  @override
  Future<Either<AuthFailure, AuthResponse>> call(SignUpParams params) async {
    return await _repository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class SignUpParams {
  final String email;
  final String password;
  final String? name;

  const SignUpParams({required this.email, required this.password, this.name});
}

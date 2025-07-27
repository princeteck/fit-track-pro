import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/auth_failure.dart';
import '../repositories/auth_repository.dart';
import 'base_usecase.dart';

@injectable
class SignInWithInstagramUseCase implements UseCase<AuthResponse, NoParams> {
  final AuthRepository _repository;

  SignInWithInstagramUseCase(this._repository);

  @override
  Future<Either<AuthFailure, AuthResponse>> call(NoParams params) async {
    return await _repository.signInWithInstagram();
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/auth_failure.dart';
import '../repositories/auth_repository.dart';
import 'base_usecase.dart';

@injectable
class SendPasswordResetEmailUseCase
    implements UseCase<Unit, PasswordResetParams> {
  final AuthRepository _repository;

  SendPasswordResetEmailUseCase(this._repository);

  @override
  Future<Either<AuthFailure, Unit>> call(PasswordResetParams params) async {
    return await _repository.sendPasswordResetEmail(email: params.email);
  }
}

class PasswordResetParams {
  final String email;

  const PasswordResetParams({required this.email});
}

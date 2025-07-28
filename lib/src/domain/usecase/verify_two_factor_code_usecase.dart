import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/auth_failure.dart';
import '../repositories/auth_repository.dart';
import 'base_usecase.dart';

@injectable
class VerifyTwoFactorCodeUseCase
    implements UseCase<Unit, VerifyTwoFactorParams> {
  final AuthRepository _repository;

  VerifyTwoFactorCodeUseCase(this._repository);

  @override
  Future<Either<AuthFailure, Unit>> call(VerifyTwoFactorParams params) async {
    return await _repository.verifyTwoFactorCode(code: params.code);
  }
}

class VerifyTwoFactorParams {
  final String code;

  const VerifyTwoFactorParams({required this.code});
}

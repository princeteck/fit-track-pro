import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/auth_failure.dart';
import '../repositories/auth_repository.dart';
import 'base_usecase.dart';

@injectable
class EnableTwoFactorAuthUseCase implements UseCase<String, NoParams> {
  final AuthRepository _repository;

  EnableTwoFactorAuthUseCase(this._repository);

  @override
  Future<Either<AuthFailure, String>> call(NoParams params) async {
    return await _repository.enableTwoFactorAuth();
  }
}

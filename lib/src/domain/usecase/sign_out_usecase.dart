import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/auth_failure.dart';
import '../repositories/auth_repository.dart';
import 'base_usecase.dart';

@injectable
class SignOutUseCase implements UseCase<Unit, NoParams> {
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  @override
  Future<Either<AuthFailure, Unit>> call(NoParams params) async {
    return await _repository.signOut();
  }
}

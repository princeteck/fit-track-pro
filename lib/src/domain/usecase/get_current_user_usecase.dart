import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/auth_failure.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';
import 'base_usecase.dart';

@injectable
class GetCurrentUserUseCase implements UseCase<User?, NoParams> {
  final AuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  @override
  Future<Either<AuthFailure, User?>> call(NoParams params) async {
    return await _repository.getCurrentUser();
  }
}

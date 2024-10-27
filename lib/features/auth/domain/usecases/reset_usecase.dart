import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/auth/domain/models/user_model.dart';
import 'package:malahi_app/features/auth/domain/repositories/auth_repository.dart';

class ResetUsecase {
  final AuthRepository repository;

  ResetUsecase(this.repository);

  Future<Either<Failure, User>> execute(String email) {
    return repository.reset(email);
  }
}

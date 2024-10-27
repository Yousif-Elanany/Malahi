import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/auth/domain/models/user_model.dart';
import 'package:malahi_app/features/auth/domain/repositories/auth_repository.dart';

class NewPasswordUsecase {
  final AuthRepository repository;

  NewPasswordUsecase(this.repository);

  Future<Either<Failure, User>> execute(String code, String password) {
    return repository.newPassword(code, password);
  }
}

// features/auth/domain/repositories/auth_repository.dart
import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/auth/domain/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> register(
      String name, String email, String password);
  Future<Either<Failure, User>> reset(String email);
  Future<Either<Failure, User>> newPassword(String code, String password);
}

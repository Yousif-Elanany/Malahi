// features/auth/data/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/auth/domain/models/user_model.dart';
import 'package:malahi_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:malahi_app/features/auth/data/data_sources/remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    return await remoteDataSource.login(email, password);
  }

  @override
  Future<Either<Failure, User>> register(
      String name, String email, String password) async {
    return await remoteDataSource.register(name, email, password);
  }

  @override
  Future<Either<Failure, User>> reset(
    String email,
  ) async {
    return await remoteDataSource.reset(email);
  }

  @override
  Future<Either<Failure, User>> newPassword(
      String code, String password) async {
    return await remoteDataSource.newPassword(code, password);
  }
}

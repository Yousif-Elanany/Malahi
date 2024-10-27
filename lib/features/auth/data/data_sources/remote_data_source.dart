import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:malahi_app/core/constants/app_config.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/core/services/auth_service.dart';
import 'package:malahi_app/features/auth/domain/models/user_model.dart';
import 'dart:developer'; // For using log

class RemoteDataSource {
  final Dio dio;

  RemoteDataSource(this.dio);

  final AuthService _authService = AuthService();

  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final response = await dio.post('${AppConfig.baseUrl}/login',
          data: {'email': email, 'password': password});

      // Log the entire response
      log("This is in response: user = ${response.toString()}");

      if (response.statusCode == 200) {
        final user = User(
          id: response.data['id'],
          email: response.data['email'],
          username: response.data['username'],
        );
        _authService.login(user);
        return Right(user);
      } else {
        return Left(ServerFailure('خطأ في تسجيل الدخول '));
      }
    } catch (e) {
      print('Login Error: $e'); // Print the error
      return Left(ServerFailure('حدث خطأ، حاول مرة أخرى ')); //${e.toString()}
    }
  }

  Future<Either<Failure, User>> register(
      String name, String email, String password) async {
    try {
      final response = await dio.post('${AppConfig.baseUrl}/register',
          data: {'username': name, 'email': email, 'password': password});

      if (response.statusCode == 201) {
        final user = User(
          id: response.data['id'],
          email: response.data['email'],
          username: response.data['username'],
        );
        _authService.login(user);
        return Right(user);
      } else {
        return Left(ServerFailure('خطأ في التسجيل'));
      }
    } catch (e) {
      return Left(ServerFailure('حدث خطأ، حاول مرة أخرى' + e.toString()));
    }
  }

  Future<Either<Failure, User>> reset(String email) async {
    try {
      final response =
          await dio.post('${AppConfig.baseUrl}/reset', data: {'email': email});
      if (response.statusCode == 201) {
        final user = User(
          id: response.data['id'],
          email: response.data['email'],
          username: response.data['username'],
        );
        return Right(user);
      } else {
        return Left(ServerFailure('البريد الالكتروني غير صحيح'));
      }
    } catch (e) {
      return Left(ServerFailure('حدث خطأ، حاول مرة أخرى'));
    }
  }

  Future<Either<Failure, User>> newPassword(
      String code, String password) async {
    try {
      final response = await dio.post('${AppConfig.baseUrl}/new-password',
          data: {'code': code, 'password': password});
      if (response.statusCode == 201) {
        final user = User(
          id: response.data['id'],
          email: response.data['email'],
          username: response.data['username'],
        );
        return Right(user);
      } else {
        return Left(ServerFailure('رمز التحقق غير صحيح'));
      }
    } catch (e) {
      return Left(ServerFailure('حدث خطأ، حاول مرة أخرى'));
    }
  }
}

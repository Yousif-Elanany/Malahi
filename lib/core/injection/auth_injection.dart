import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/features/auth/data/data_sources/remote_data_source.dart';
import 'package:malahi_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:malahi_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:malahi_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:malahi_app/features/auth/domain/usecases/new_password_usecase.dart';
import 'package:malahi_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:malahi_app/features/auth/domain/cubit/auth_cubit.dart';
import 'package:malahi_app/features/auth/domain/usecases/reset_usecase.dart';

class AuthInjection {
  static final AuthInjection _instance = AuthInjection._internal();

  factory AuthInjection() {
    return _instance;
  }

  AuthInjection._internal();

  final Dio _dio = Dio(); // Initialize Dio
  late final RemoteDataSource _remoteDataSource = RemoteDataSource(_dio);
  late final AuthRepository _authRepository =
      AuthRepositoryImpl(_remoteDataSource);
  late final LoginUseCase _loginUseCase = LoginUseCase(_authRepository);
  late final RegisterUseCase _registerUseCase =
      RegisterUseCase(_authRepository);
  late final ResetUsecase _resetUseCase = ResetUsecase(_authRepository);
  late final NewPasswordUsecase _newPasswordtUseCase =
      NewPasswordUsecase(_authRepository);

  BlocProvider<AuthCubit> get authCubit {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(
        loginUseCase: _loginUseCase,
        registerUseCase: _registerUseCase,
        resetUseCase: _resetUseCase,
        newPasswordUseCase: _newPasswordtUseCase,
      ),
    );
  }
}

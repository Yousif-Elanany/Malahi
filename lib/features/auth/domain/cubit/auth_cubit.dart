import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:malahi_app/features/auth/domain/models/user_model.dart';
import 'package:malahi_app/core/errors/failure.dart';
import 'package:malahi_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:malahi_app/features/auth/domain/usecases/new_password_usecase.dart';
import 'package:malahi_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:malahi_app/features/auth/domain/usecases/reset_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ResetUsecase resetUseCase;
  final NewPasswordUsecase newPasswordUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.resetUseCase,
    required this.newPasswordUseCase,
  }) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final result = await loginUseCase.execute(email, password);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> register(String name, String email, String password) async {
    emit(AuthLoading());
    final result = await registerUseCase.execute(name, email, password);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> reset(String email) async {
    emit(AuthLoading());
    final result = await resetUseCase.execute(email);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> newPassword(String code, String password) async {
    emit(AuthLoading());
    final result = await newPasswordUseCase.execute(code, password);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  void logout() {
    emit(AuthInitial());
  }
}

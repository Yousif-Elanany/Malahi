import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/features/auth/domain/cubit/auth_cubit.dart';
import 'package:malahi_app/features/auth/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is AuthAuthenticated) {
            Navigator.pushReplacementNamed(context, '/tabs');
          }
        },
        builder: (context, state) {
          // Pass the state to the LoginForm
          return LoginForm(state: state);
        },
      ),
    );
  }
}

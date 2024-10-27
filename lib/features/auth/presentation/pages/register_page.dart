import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/core/widgets/app_bar_back.dart';

import 'package:malahi_app/features/auth/domain/cubit/auth_cubit.dart';
import 'package:malahi_app/features/auth/presentation/widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('تسجيل جديد')),
      appBar: AppBarBack(),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          }
          if (state is AuthAuthenticated) {
            // Navigate to the home screen
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return RegisterForm();
        },
      ),
    );
  }
}

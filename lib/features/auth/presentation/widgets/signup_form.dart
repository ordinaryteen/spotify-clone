import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/shared/widgets/basic_app_button.dart';
import 'package:spotify_clone/shared/widgets/basic_text_field.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_event.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_state.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.go('/home');
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            BasicTextField(
              hintText: 'Full Name',
              controller: _fullNameController,
            ),
            const SizedBox(height: 15),
            BasicTextField(
              hintText: 'Enter Email',
              controller: _emailController,
            ),
            const SizedBox(height: 15),
            BasicTextField(
              hintText: 'Password',
              controller: _passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 30),
            BasicAppButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      AuthSignUpEvent(
                        email: _emailController.text,
                        password: _passwordController.text,
                        fullName: _fullNameController.text,
                      ),
                    );
              },
              title: 'Create Account',
              isLoading: state is AuthLoading,
            ),
          ],
        );
      },
    );
  }
}

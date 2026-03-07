import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/shared/widgets/basic_app_button.dart';
import 'package:spotify_clone/shared/widgets/basic_text_field.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_event.dart';
import 'package:spotify_clone/features/auth/presentation/bloc/auth_state.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
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
              hintText: 'Enter Email',
              controller: _emailController,
            ),
            const SizedBox(height: 15),
            BasicTextField(
              hintText: 'Password',
              controller: _passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(left: 12),
                  minimumSize: const Size(0, 0),
                ),
                child: const Text('Recovery Password',
                    style: TextStyle(color: Colors.grey, fontSize: 14)),
              ),
            ),
            const SizedBox(height: 20),
            BasicAppButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      AuthSignInEvent(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
              },
              title: 'Sign In',
              isLoading: state is AuthLoading,
            ),
          ],
        );
      },
    );
  }
}

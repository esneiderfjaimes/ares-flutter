// lib/screens/google_sign_in_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/google_sign_in/google_sign_in_bloc.dart';
import '../blocs/google_sign_in/google_sign_in_event.dart';
import '../blocs/google_sign_in/google_sign_in_state.dart';

class GoogleSignInPage extends StatelessWidget {
  const GoogleSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Sign-In")),
      body: BlocConsumer<GoogleSignInBloc, GoogleSignInState>(
        listener: (context, state) {
          if (state is GoogleSignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is GoogleSignInLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GoogleSignInSuccess) {
            return Center(
                child: Text("Bienvenido, ${state.user.displayName}!"));
          } else {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<GoogleSignInBloc>().add(GoogleSignInRequested());
                },
                child: const Text("Iniciar sesión con Google"),
              ),
            );
          }
        },
      ),
    );
  }
}

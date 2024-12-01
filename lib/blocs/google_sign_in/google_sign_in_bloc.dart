import 'package:ares/data/authentication/google_sign_in_service.dart';
import 'package:ares/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'google_sign_in_event.dart';
import 'google_sign_in_state.dart';

class GoogleSignInBloc extends Bloc<GoogleSignInEvent, GoogleSignInState> {
  final GoogleSignInService googleSignInService;

  GoogleSignInBloc({required this.googleSignInService})
      : super(GoogleSignInInitial()) {
    on<GoogleSignInRequested>((event, emit) async {
      emit(GoogleSignInLoading());
      try {
        final user = await googleSignInService.signInWithGoogle();
        if (user != null) {
          emit(GoogleSignInSuccess(user));
        } else {
          emit(GoogleSignInFailure("Autenticación cancelada."));
        }
      } catch (e) {
        logger.e(e);
        emit(GoogleSignInFailure("Error al iniciar sesión con Google."));
        rethrow;
      }
    });
    on<GoogleSignOutRequested>((event, emit) async {
      emit(GoogleSignInLoading());
      await googleSignInService.signOut();
      emit(GoogleSignInInitial());
    });
  }
}

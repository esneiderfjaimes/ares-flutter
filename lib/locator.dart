// lib/locator.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'blocs/google_sign_in/google_sign_in_bloc.dart';
import 'data/authentication/google_sign_in_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Register dependencies
  locator.registerLazySingleton<GoogleSignInService>(
    () => GoogleSignInService(
      googleSignIn: GoogleSignIn(
        clientId: '1014252413822-2dn0ncrp2appd3o0c6h7u5p6hhtth733.apps.googleusercontent.com',
      ),
      auth: FirebaseAuth.instance,
    ),
  );

  locator.registerFactory<GoogleSignInBloc>(
    () => GoogleSignInBloc(
      googleSignInService: locator(),
    ),
  );
}

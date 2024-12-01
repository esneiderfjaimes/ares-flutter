// lib/locator.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
        clientId: dotenv.env['GOOGLE_CLIENT_ID'],
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

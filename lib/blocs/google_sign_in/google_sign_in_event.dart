import 'package:equatable/equatable.dart';

import 'google_sign_in_state.dart';

abstract class GoogleSignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GoogleSignInRequested extends GoogleSignInEvent {}

class GoogleSignOutRequested extends GoogleSignInEvent {}

class GoogleSignInFailure extends GoogleSignInState {
  final String error;

  GoogleSignInFailure(this.error);

  @override
  List<Object?> get props => [error];
}
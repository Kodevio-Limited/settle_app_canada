import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthStatus {
  unauthenticated,
  guest,
  authenticated,
}

class AuthState {
  final AuthStatus status;
  final String? email;
  final bool hasGivenConsent;
  final bool notificationsEnabled;
  final bool locationEnabled;
  final String? postalPrefix;

  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.email,
    this.hasGivenConsent = false,
    this.notificationsEnabled = false,
    this.locationEnabled = false,
    this.postalPrefix,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? email,
    bool? hasGivenConsent,
    bool? notificationsEnabled,
    bool? locationEnabled,
    String? postalPrefix,
  }) {
    return AuthState(
      status: status ?? this.status,
      email: email ?? this.email,
      hasGivenConsent: hasGivenConsent ?? this.hasGivenConsent,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      locationEnabled: locationEnabled ?? this.locationEnabled,
      postalPrefix: postalPrefix ?? this.postalPrefix,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  void setGuest() {
    state = state.copyWith(status: AuthStatus.guest);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void verifyAndSignIn() {
    state = state.copyWith(status: AuthStatus.authenticated);
  }

  void setConsent(bool consent) {
    state = state.copyWith(hasGivenConsent: consent);
  }

  void setNotifications(bool enabled) {
    state = state.copyWith(notificationsEnabled: enabled);
  }

  void setLocation(bool enabled, [String? postal]) {
    state = state.copyWith(locationEnabled: enabled, postalPrefix: postal);
  }

  void signOut() {
    state = const AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});


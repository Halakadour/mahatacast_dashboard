part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  authSuccess,
  authFailed,
}

class AuthState {
  AuthStatus authModelStatus;
  LoginModel? authModel;
  AuthStatus logoutStatus;
  AuthState({
    this.authModelStatus = AuthStatus.initial,
    this.authModel,
    this.logoutStatus = AuthStatus.initial
  });

  AuthState copyWith({
    AuthStatus? authModelStatus,
    LoginModel? authModel,
    AuthStatus? logoutStatus,
  }) {
    return AuthState(
      authModelStatus: authModelStatus ?? this.authModelStatus,
      authModel: authModel ?? this.authModel,
      logoutStatus: logoutStatus ?? this.logoutStatus,
    );
  }
}

// State für UI Actions (Loading, Error)
sealed class AuthActionState {
  const AuthActionState();

  const factory AuthActionState.initial() = AuthActionInitial;
  const factory AuthActionState.loading() = AuthActionLoading;
  const factory AuthActionState.success() = AuthActionSuccess;
  const factory AuthActionState.error(String message) = AuthActionError;
}

class AuthActionInitial extends AuthActionState {
  const AuthActionInitial();
}

class AuthActionLoading extends AuthActionState {
  const AuthActionLoading();
}

class AuthActionSuccess extends AuthActionState {
  const AuthActionSuccess();
}

class AuthActionError extends AuthActionState {
  final String message;
  const AuthActionError(this.message);
}

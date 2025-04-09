abstract class VerificationState {}

class VerificationInitial extends VerificationState {}

class VerificationLoading extends VerificationState {}

class VerificationSuccess extends VerificationState {
  final String user;

  VerificationSuccess(this.user);
}

class VerificationFailure extends VerificationState {
  final String error;

  VerificationFailure(this.error);
}

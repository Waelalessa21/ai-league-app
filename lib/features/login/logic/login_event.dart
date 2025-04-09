abstract class VerificationEvent {}

class SubmitVerification extends VerificationEvent {
  final String nationalId;
  final String ticketNumber;

  SubmitVerification(this.nationalId, this.ticketNumber);
}

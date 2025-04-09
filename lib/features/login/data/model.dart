class VerifyRequest {
  final String nationalId;
  final String ticketNumber;

  VerifyRequest({required this.nationalId, required this.ticketNumber});

  Map<String, dynamic> toJson() {
    return {
      'national_id': nationalId,
      'ticket_number': ticketNumber,
    };
  }
}

class VerifyResponse {
  final String status;
  final String user;

  VerifyResponse({required this.status, required this.user});

  factory VerifyResponse.fromJson(Map<String, dynamic> json) {
    return VerifyResponse(
      status: json['status'],
      user: json['user'],
    );
  }
}

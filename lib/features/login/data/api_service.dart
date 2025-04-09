import 'dart:convert';
import 'package:ai_league/features/login/data/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = "https://vision-api-production.up.railway.app";

  Future<VerifyResponse> verify(VerifyRequest request) async {
    final response = await http.post(
      Uri.parse("$baseUrl/verify/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return VerifyResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Verification failed");
    }
  }
}

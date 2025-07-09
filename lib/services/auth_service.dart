import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:selcax_pos/services/token_service.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000";

  static Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/login"),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {"username": email, "password": password},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      await TokenService.saveToken(data['access_token']);

      return "Login berhasil";
    } else {
      throw Exception("${response.body}");
    }
  }
}

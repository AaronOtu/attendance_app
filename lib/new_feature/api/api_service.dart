import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:attendance_app/new_feature/api/models/login_response_model.dart';

class ApiService {
  final String endpoint = 'https://lmg.gomlak.com/user/login';

  Future<LoginResponseModel> loginUser(String email, String password) async {
    try {
      final Map<String, String> body = {
        'email': email,
        'password': password,
      };

      http.Response response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        LoginResponseModel loginResponse =
            LoginResponseModel.fromJson(responseData);

        return loginResponse;
      } else if (response.statusCode == 401) {
        throw Exception('Invalid email or password');
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }
}

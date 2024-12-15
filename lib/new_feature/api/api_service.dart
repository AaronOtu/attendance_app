import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:attendance_app/new_feature/api/models/login_response_model.dart';

class ApiService {
  final String endpoint = 'https://lmg.gomlak.com/user/login';

  Future<LoginResponseModel> loginUser(String email, String password) async {
    try {
      // Create the request body
      final Map<String, String> body = {
        'email': email,
        'password': password,
      };

      // Send POST request
      http.Response response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      // Check response status code
      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        
        // Convert JSON to LoginResponseModel
        LoginResponseModel loginResponse = LoginResponseModel.fromJson(responseData);

        return loginResponse;
      } else if (response.statusCode == 401) {
        // Unauthorized - typically means invalid credentials
        throw Exception('Invalid email or password');
      } else {
        // Handle other error status codes
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      // Catch and rethrow any network or parsing errors
      throw Exception('Error during login: $e');
    }
  }
}
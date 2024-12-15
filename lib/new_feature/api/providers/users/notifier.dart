// 

import 'package:attendance_app/new_feature/api/api_service.dart';
import 'package:attendance_app/new_feature/api/models/login_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum to represent login status
enum LoginStatus { initial, loading, success, error }

// Custom LoginState to work with your existing LoginResponseModel
class LoginState {
  final LoginStatus status;
  final LoginResponseModel? loginResponse;
  final String? errorMessage;

  LoginState({
    required this.status, 
    this.loginResponse, 
    this.errorMessage
  });

  // Initial state
  factory LoginState.initial() => LoginState(
    status: LoginStatus.initial,
    loginResponse: null,
    errorMessage: null
  );

  // Check if user is authenticated based on token
  bool get isAuthenticated => 
    loginResponse?.token != null && loginResponse!.token!.isNotEmpty;

  // Convenience method to create a copy with optional changes
  LoginState copyWith({
    LoginStatus? status,
    LoginResponseModel? loginResponse,
    String? errorMessage
  }) {
    return LoginState(
      status: status ?? this.status,
      loginResponse: loginResponse ?? this.loginResponse,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }
}

class UserNotifier extends StateNotifier<LoginState> {
  final ApiService apiService;

  UserNotifier(this.apiService) : super(LoginState.initial());

  Future<void> loginUser(String email, String password) async {
    // Set state to loading before attempting login
    state = state.copyWith(status: LoginStatus.loading);

    try {
      final loginResponse = await apiService.loginUser(email, password);
      
      if (loginResponse.token != null) {
        // Successful login
        state = state.copyWith(
          status: LoginStatus.success, 
          loginResponse: loginResponse,
          errorMessage: null
        );
      } else {
        // Login failed but no exception thrown
        state = state.copyWith(
          status: LoginStatus.error, 
          loginResponse: null,
          errorMessage: loginResponse.message ?? 'Login failed'
        );
      }
    } catch (e) {
      // Handle any exceptions during login
      state = state.copyWith(
        status: LoginStatus.error, 
        loginResponse: null,
        errorMessage: e.toString()
      );
    }
  }

  void resetState() {
    state = LoginState.initial();
  }
}

final apiProvider = Provider<ApiService>((ref) => ApiService());
final userDataProvider = StateNotifierProvider<UserNotifier, LoginState>((ref) => 
  UserNotifier(ref.read(apiProvider))
);
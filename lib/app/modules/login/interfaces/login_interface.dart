import '../models/_export_login.dart';

abstract interface class LoginServiceInterface {
  Future<LoginModel?> fetchLogin({
    required LoginModel loginModel,
    required String username,
    required String password,
  });
}

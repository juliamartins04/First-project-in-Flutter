import '../../core/_export_core.dart';
import '../interfaces/_export_interface.dart';
import '../models/_export_login.dart';
import '_export_service.dart';

class LoginService implements LoginServiceInterface {
  @override
  Future<LoginModel?> fetchLogin({
    required LoginModel loginModel,
    required String username,
    required String password,
  }) async {
    String url = AppConstant.loginURL;
    try {
      final response = await Network.internal().post(
        url: url,
        headers: LoginModelHeader.getLoginHeaders(),
        body: LoginModel.body(loginModel: loginModel),
      );
      if (response == null) {
        return null;
      } else {
        LoginModel loginModelResponse = LoginModel.fromMap(response);
        return loginModelResponse;
      }
    } catch (error) {
      rethrow;
    }
  }
}

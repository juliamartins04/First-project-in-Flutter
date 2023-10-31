import 'package:mobx/mobx.dart';

import '../interfaces/_export_interface.dart';
import '../models/_export_login.dart';
import '../services/_export_service.dart';

part 'login_store.g.dart';

class LoginStore = BaseLoginStore with _$LoginStore;

abstract class BaseLoginStore with Store {
  LoginServiceInterface loginServiceInterface = LoginService();
  BaseLoginStore();

  @observable
  LoginModel? loginModel;

  @observable
  bool isLoading = false;

  @observable
  bool isPasswordVisible = false;

  @action
  Future<bool> getLogin({
    required String username,
    required String password,
  }) async {
    isLoading = true;
    try {
      loginModel = LoginModel(
        username: username,
        password: password,
      );
      loginModel = await loginServiceInterface.fetchLogin(
          loginModel: loginModel!, username: username, password: password);
      if (loginModel != null) {
        return true;
      }
      return false;
    } catch (error) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}

import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_first_project/app/modules/home/_export_home_module.dart';
import 'package:my_first_project/translations/locale_keys.g.dart';

import '../stores/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  late LoginStore _loginStore;

  void _initPage() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _loginStore = LoginStore();
  }

  @override
  void initState() {
    _initPage();
    super.initState();
  }

  void _disposeControllers() {
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  Widget _isLoadingProgress() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }

  Widget _formLoginFields() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                SizedBox(
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Colors.black12,
                          width: 1.5,
                        ),
                      ),
                      hintText: LocaleKeys.screens_login_email.tr(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Colors.black12,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _loginStore.isPasswordVisible,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Colors.black12,
                          width: 1.5,
                        ),
                      ),
                      hintText: LocaleKeys.screens_login_password.tr(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Colors.black12,
                          width: 1.5,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _loginStore.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _loginStore.isPasswordVisible =
                                !_loginStore.isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: SizedBox(
              height: 40.0,
              width: double.maxFinite,
              child: FilledButton(
                onPressed: () async {
                  _loginButton();
                },
                child: Text(LocaleKeys.screens_login_enter.tr()),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.screens_login_enter.tr()),
      ),
      body: Stack(
        children: [
          Observer(
            builder: (context) {
              if (_loginStore.isLoading) {
                return _isLoadingProgress();
              } else {
                return Column(
                  children: [
                    _formLoginFields(),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _sendSnackBarLoginSuccessfully() {
    AsukaSnackbar.success(
            LocaleKeys.screens_login_messages_login_successfully.tr())
        .show();
  }

  void _sendSnackBarLoginFailed() {
    AsukaSnackbar.info(
            LocaleKeys.screens_login_messages_oops_an_error_occurred.tr())
        .show();
  }

  void _pushHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  Future<void> _loginButton() async {
    bool isValid = await _loginStore.getLogin(
      username: _usernameController.text,
      password: _passwordController.text,
    );
    if (isValid) {
      _pushHomePage();
      _sendSnackBarLoginSuccessfully();
    } else {
      _sendSnackBarLoginFailed();
    }
  }
}

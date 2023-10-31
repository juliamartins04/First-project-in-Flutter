// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "screens": {
    "login": {
      "email": "Email",
      "password": "Password",
      "enter": "Enter",
      "messages": {
        "login_successfully": "Login successfully :)",
        "oops_an_error_occurred": "Oops, an error occurred :/"
      }
    },
    "home": {
      "await_loading": "Await, loading...",
      "button_see_more": "See more",
      "cards": {
        "age": "Age",
        "id": "ID"
      },
      "dialog": {
        "attention": "Attention",
        "are_you_sure_about_that": "Are you sure you want to view an unavailable profile?",
        "yes": "Yes, view",
        "close": "Close"
      }
    },
    "details": {
      "details": "Details",
      "available": "Available",
      "unavailable": "Unavailable",
      "not_found_details": "Sorry, the user did not include details :/"
    }
  }
};
static const Map<String,dynamic> pt_BR = {
  "screens": {
    "login": {
      "email": "E-mail",
      "password": "Senha",
      "enter": "Entrar",
      "messages": {
        "login_successfully": "Login efetuado com sucesso :)",
        "oops_an_error_occurred": "Ops, ocorreu algum erro :/"
      }
    },
    "home": {
      "await_loading": "Aguarde, carregando...",
      "button_see_more": "Ver mais",
      "cards": {
        "age": "Idade",
        "id": "ID"
      },
      "dialog": {
        "attention": "Atenção",
        "are_you_sure_about_that": "Você tem certeza que deseja visualizar um peril indisponível?",
        "yes": "Sim, visualizar",
        "close": "Fechar"
      }
    },
    "details": {
      "details": "Detalhes",
      "available": "Disponível",
      "unavailable": "Indisponível",
      "not_found_details": "Desculpe, o usuário não incluiu os detalhes :/"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "pt_BR": pt_BR};
}

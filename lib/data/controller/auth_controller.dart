import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:necessary_pink_demo/components/np_page_state_widget.dart';
import 'package:necessary_pink_demo/data/controller/validation_controller.dart';
import 'package:necessary_pink_demo/data/models/login_user_content.dart';
import 'package:necessary_pink_demo/data/models/register_user_content.dart';

class AuthController with ChangeNotifier {
  RegisterUserContent registerUserContent = RegisterUserContent();
  LoginUserContent loginUserContent = LoginUserContent();

  LoginView _view;
  PageState pageState = PageState.loaded;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final ValidationController _validationController = ValidationController();

  set setRegistrationView(LoginView view) {
    this._view = view;
  }

  registerUser() {
    if (isValidForm()) {
      try {
        pageState = PageState.loading;
        notifyListeners();
        _auth
            .createUserWithEmailAndPassword(
                email: registerUserContent.email,
                password: registerUserContent.password)
            .then((value) {
          pageState = PageState.loaded;
          notifyListeners();

          if (value.user != null) {
            _view.onSuccess();
          } else {
            _view.onError("Registration Error");
          }
        }, onError: (_) {
          pageState = PageState.loaded;
          notifyListeners();
          _view.onError(_.toString());
        });
      } catch (_) {
        _view.onError("Something wrong happened");
      }
    }
  }

  loginUser() {
    if (isLoginFormValid()) {
      try {
        pageState = PageState.loading;
        notifyListeners();
        _auth
            .signInWithEmailAndPassword(
                email: loginUserContent.email,
                password: loginUserContent.password)
            .then((value) {
          pageState = PageState.loaded;
          notifyListeners();

          if (value.user != null) {
            _view.onSuccess();
          } else {
            _view.onError("login Error");
          }
        }, onError: (_) {
          pageState = PageState.loaded;
          notifyListeners();
          _view.onError(_.toString());
        });
      } catch (_) {
        _view.onError("Something wrong happened");
      }
    }
  }

  googleSignIn() async {
    try {
      pageState = PageState.loading;
      notifyListeners();
      await _googleSignIn.signIn().then((value) {
        pageState = PageState.loaded;
        notifyListeners();
        if (value.email != null) {
          _view.onSuccess();
        } else {
          _view.onError("login Error");
        }
      });
    } catch (error) {
      pageState = PageState.loaded;
      notifyListeners();
      _view.onError(error.toString());
      print(error);
    }
  }

  bool isValidForm() {
    if (_validationController.validateEmail(registerUserContent.email ?? "")) {
      _view.onError("Invalid email");
      return false;
    } else if (registerUserContent.password == null) {
      _view.onError("Invalid password");
      return false;
    } else if (registerUserContent.password.length < 6) {
      _view.onError("Password should be at least 6 characters");
      return false;
    }
    return true;
  }

  bool isLoginFormValid() {
    if (_validationController.validateEmail(loginUserContent.email ?? "")) {
      _view.onError("Invalid email");
      return false;
    } else if (loginUserContent.password == null) {
      _view.onError("Invalid password");
      return false;
    }
    return true;
  }
}

abstract class LoginView {
  void onSuccess();
  void onError(String error);
}

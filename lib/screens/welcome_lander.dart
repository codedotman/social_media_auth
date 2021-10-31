import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:necessary_pink_demo/components/bottom_dialog_helper.dart';
import 'package:necessary_pink_demo/components/np_button.dart';
import 'package:necessary_pink_demo/components/np_images.dart';
import 'package:necessary_pink_demo/components/np_scaffold.dart';
import 'package:necessary_pink_demo/components/np_snackbar.dart';
import 'package:necessary_pink_demo/data/controller/auth_controller.dart';
import 'package:necessary_pink_demo/screens/main_screen.dart';
import 'package:provider/provider.dart';

class WelcomeLander extends StatefulWidget {
  const WelcomeLander({Key key}) : super(key: key);

  @override
  _WelcomeLanderState createState() => _WelcomeLanderState();
}

class _WelcomeLanderState extends State<WelcomeLander> implements LoginView {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var registrationController =
        Provider.of<AuthController>(context, listen: true);
    registrationController.setRegistrationView = this;
    return NPScaffold(
      scaffoldKey: _scaffoldKey,
      builder: (context) => Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(NPImages.welcomeLottie),
            Text(
              "Let's get you set-up Dispatch with Necessary anytime you want, and enjoy quality service ",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: NPButton(
                title: "Login",
                callback: () => showAuthSelectorBottomSheet(context, false,
                    googleReg: () => registrationController.googleSignIn()),
              ),
            ),
            NPButton(
              title: "Register",
              callback: () => showAuthSelectorBottomSheet(context, true,
                  googleReg: () => registrationController.googleSignIn()),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onError(String error) {
    showSnackbar(
      error,
      context,
      key: _scaffoldKey,
    );
  }

  @override
  void onSuccess() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainScreen()));
  }
}

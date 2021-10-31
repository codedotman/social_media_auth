import 'package:flutter/material.dart';
import 'package:necessary_pink_demo/components/np_button.dart';
import 'package:necessary_pink_demo/components/np_images.dart';
import 'package:necessary_pink_demo/screens/auth_screen.dart';

class AuthSelector extends StatelessWidget {
  final bool register;
  final VoidCallback googleReg;
  const AuthSelector({Key key, this.register = false, this.googleReg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        register
            ? Text("By signing up, you're agreeing to the",
                style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Colors.black, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center)
            : Container(),
        register
            ? GestureDetector(
                onTap: () {
                  // urlLauncher();
                },
                child: Text("Terms of use and privacy policy",
                    style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              )
            : Container(),
        SizedBox(height: 15),
        NPButton(
          title: "Continue with Google",
          textStyle: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
          color: Colors.blue,
          leadingAsset: NPImages.googleIcon,
          callback: () {
            Navigator.pop(context);
            googleReg();
          },
        ),
        SizedBox(height: 10),
        NPButton(
          title: "Continue with Necessary",
          callback: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AuthScreen(
                    isRegister: register,
                  ))),
        ),
      ],
    );
  }
}

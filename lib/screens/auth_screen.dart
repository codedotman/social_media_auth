import 'package:flutter/material.dart';
import 'package:necessary_pink_demo/components/np_appBar.dart';
import 'package:necessary_pink_demo/components/np_button.dart';
import 'package:necessary_pink_demo/components/np_colors.dart';
import 'package:necessary_pink_demo/components/np_form.dart';
import 'package:necessary_pink_demo/components/np_images.dart';
import 'package:necessary_pink_demo/components/np_scaffold.dart';
import 'package:necessary_pink_demo/components/np_snackbar.dart';
import 'package:necessary_pink_demo/data/controller/auth_controller.dart';
import 'package:necessary_pink_demo/screens/main_screen.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  final bool isRegister;
  const AuthScreen({Key key, this.isRegister}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> implements LoginView {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var registrationController =
        Provider.of<AuthController>(context, listen: true);
    registrationController.setRegistrationView = this;
    return NPScaffold(
        appBar: NPAppBar(),
        backgroundColor: Colors.white,
        scaffoldKey: _scaffoldKey,
        state: AppState(pageState: registrationController.pageState),
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset(NPImages.background).image)),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Text(
                              widget.isRegister
                                  ? "Get Started on Necessary Pink "
                                  : "Welcome back,",
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.isRegister
                                ? "Please sign up "
                                : "Please sign in.",
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(
                                    color: greyColor,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    child: NPForm(
                      controller: _emailController,
                      enabledBorderColor: Colors.grey,
                      labelText: "Email",
                      hintText: "Enter email e.g. coxena@email.com",
                      onChange: (v) {
                        widget.isRegister
                            ? registrationController.registerUserContent.email =
                                v
                            : registrationController.loginUserContent.email = v;
                      },
                    ),
                  ),
                  Container(
                    child: NPForm(
                      controller: _passwordController,
                      enabledBorderColor: Colors.grey,
                      labelText: "Password",
                      hintText: "Enter password",
                      forPassword: true,
                      onChange: (v) {
                        widget.isRegister
                            ? registrationController
                                .registerUserContent.password = v
                            : registrationController.loginUserContent.password =
                                v;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  NPButton(
                    title: "LOG IN",
                    callback: () {
                      widget.isRegister
                          ? registrationController.registerUser()
                          : registrationController.loginUser();
                    },
                  ),
                ],
              ),
            ),
          );
        });
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

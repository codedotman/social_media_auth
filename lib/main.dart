import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:necessary_pink_demo/data/controller/auth_controller.dart';
import 'package:necessary_pink_demo/screens/welcome_lander.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: () => MaterialApp(
          title: 'Necessary Pink',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: getTextTheme()),
          home: WelcomeLander(),
        ),
      ),
    );
  }

  TextTheme getTextTheme() {
    return TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        fontFamily: "Gilroy",
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 26.sp,
        fontFamily: "Gilroy",
      ),
      headline3: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        fontFamily: "Gilroy",
      ),
      headline4: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 10.sp,
        fontFamily: "Gilroy",
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
        fontFamily: "Gilroy",
      ),
      headline6: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        fontFamily: "Gilroy",
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        fontFamily: "Gilroy",
      ),
      subtitle2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 8.sp,
        fontFamily: "Gilroy",
      ),
      bodyText2: TextStyle(
        fontSize: 30.sp,
        fontFamily: "Gilroy",
      ),
      bodyText1: TextStyle(
        fontSize: 12.sp,
        fontFamily: "Gilroy",
      ),
    );
  }
}

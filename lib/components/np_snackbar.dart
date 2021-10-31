import 'package:flutter/material.dart';
import 'package:necessary_pink_demo/components/np_colors.dart';
import 'package:necessary_pink_demo/components/np_images.dart';

Future<void> showSnackbar(String text, BuildContext context,
    {GlobalKey<ScaffoldState> key,
    SnackBarAction action,
    Color textColor,
    Color backgroundColor,
    Duration duration}) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.height * 0.40,
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline3.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Spacer(),
        InkWell(
            onTap: () => key.currentState.hideCurrentSnackBar(),
            child: Image.asset(NPImages.closeIcon))
      ],
    ),
    duration: duration ?? Duration(milliseconds: 20000),
    backgroundColor: subColor,
    action: action,
  );
  if (key != null) {
    key.currentState.showSnackBar(snackBar);
  } else {
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

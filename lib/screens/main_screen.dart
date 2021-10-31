import 'package:flutter/material.dart';
import 'package:necessary_pink_demo/components/np_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome To Necessary Pink",
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: subColor,
                ),
          ),
        ],
      ),
    );
  }
}

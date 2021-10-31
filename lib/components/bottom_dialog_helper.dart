import 'package:flutter/material.dart';
import 'package:necessary_pink_demo/screens/auth_selector.dart';

_createExtensibleDialogWidget(
  Widget body,
  BuildContext context, {
  BorderRadiusGeometry borderRadius,
  EdgeInsetsGeometry padding,
}) {
  return SafeArea(
    child: Container(
      color: Colors.white,
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: borderRadius ??
                BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                body,
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Future<void> showAuthSelectorBottomSheet(BuildContext context, bool register,
    {VoidCallback googleReg}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return _createExtensibleDialogWidget(
        AuthSelector(
          googleReg: googleReg,
          register: register,
        ),
        context,
        padding: const EdgeInsets.all(20),
      );
    },
  );
}

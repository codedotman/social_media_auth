import 'package:flutter/material.dart';

import 'np_colors.dart';

class NPButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final bool loading;
  final Color color, borderColor, disabledColor;
  final TextStyle textStyle;
  final bool disAble;
  final Widget child;
  final String leadingAsset;

  const NPButton(
      {Key key,
      this.title,
      this.callback,
      this.loading = false,
      this.disAble = false,
      this.color,
      this.textStyle,
      this.borderColor,
      this.disabledColor,
      this.child,
      this.leadingAsset})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: color ?? subTitleColor,
      onTap: (loading || disAble) ? null : callback,
      child: Container(
        height: 49,
        decoration: (loading || disAble)
            ? BoxDecoration(
                color: disabledColor ?? Colors.white,
                border:
                    Border.all(color: borderColor ?? Colors.black, width: 0.2),
                borderRadius: BorderRadius.circular(5))
            : BoxDecoration(
                color: color ?? subColor,
                border: Border.all(
                    color: borderColor ?? Colors.transparent, width: 0.9),
                borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            leadingAsset != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Image.asset(leadingAsset),
                  )
                : Container(),
            Center(
                child: (child ??
                    Text(title,
                        style: textStyle ??
                            Theme.of(context).textTheme.headline3.copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.w700)))),
          ],
        ),
      ),
    );
  }
}

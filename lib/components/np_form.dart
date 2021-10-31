import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:necessary_pink_demo/components/np_colors.dart';

class NPForm extends StatefulWidget {
  final String labelText, hintText, suffixText;
  final bool forPassword, enable;
  final EdgeInsetsGeometry padding;
  final Color fillColor,
      inputTextColor,
      focusedBorderColor,
      enabledBorderColor,
      disabledBorderColor,
      labelColor,
      border;
  final EdgeInsetsGeometry contentPadding;
  final Icon suffixIcon;
  final Function(String) onChange;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final TextStyle hintStyle;

  const NPForm(
      {Key key,
      this.enable = true,
      this.labelText,
      this.hintText,
      this.forPassword = false,
      this.padding,
      this.fillColor,
      this.contentPadding,
      this.onChange,
      this.suffixIcon,
      this.inputFormatters,
      this.keyboardType,
      this.controller,
      this.inputTextColor,
      this.focusedBorderColor,
      this.enabledBorderColor,
      this.labelColor,
      this.hintStyle,
      this.disabledBorderColor,
      this.suffixText,
      this.border})
      : super(key: key);

  @override
  _NPFormState createState() => _NPFormState();
}

class _NPFormState extends State<NPForm> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(
            vertical: 10,
          ),
      child: Container(
        height: 49,
        child: TextFormField(
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          enabled: widget.enable,
          onChanged: widget.onChange,
          cursorColor: subColor,
          obscureText: widget.forPassword && showPassword,
          style: TextStyle(
              color: widget.inputTextColor ?? Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              suffixText: widget.suffixText,
              contentPadding: widget.contentPadding ?? const EdgeInsets.all(8),
              fillColor: widget.fillColor,
              filled: true,
              suffix: widget.forPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: showPassword
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                              size: 15,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.black,
                              size: 15,
                            ))
                  : (widget.suffixIcon),
              labelText: widget.labelText,
              hintText: widget.hintText,
              labelStyle: TextStyle(color: widget.labelColor ?? greyColor),
              hintStyle:
                  widget.hintStyle ?? const TextStyle(color: Colors.grey),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.disabledBorderColor ?? greyColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.enabledBorderColor ??
                          const Color(0xffbfc9da))),
              border:
                  OutlineInputBorder(borderSide: BorderSide(color: greyColor)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.focusedBorderColor ?? subColor))),
        ),
      ),
    );
  }
}

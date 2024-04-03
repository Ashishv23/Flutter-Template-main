import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/src/utils/colors.dart';
import 'package:flutter_template/src/utils/images.dart';
import 'package:flutter_template/src/utils/styles.dart';
// import 'package:flutter_template/widgets/styles.dart';

class CustomTextField extends StatefulWidget {
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final bool? isReadOnly;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final String? suffixIconData;
  final Color? suffixIconColor;
  final bool? showPasswordToggleIcon;
  final bool? enable;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final String? label;
  final TextStyle? labelStyle;
  final TextCapitalization? textCapitalization;
  final String? initialValue;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool? autoFocuss;
  final Function(String)? onSubmitted;

  const CustomTextField(
      {Key? key,
      this.onTap,
      this.keyboardType,
      this.controller,
      this.textStyle,
      this.isReadOnly,
      this.maxLines,
      this.hintText,
      this.hintTextStyle,
      this.suffixIconData,
      this.suffixIconColor,
      this.showPasswordToggleIcon,
      this.validator,
      this.onChanged,
      this.enable,
      this.focusNode,
      this.label,
      this.labelStyle,
      this.initialValue,
      this.maxLength,
      this.inputFormatters,
      this.autoFocuss,
      this.onSubmitted,
      this.textCapitalization})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      autovalidateMode: AutovalidateMode.always,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      autofocus: widget.autoFocuss ?? false,
      enabled: widget.enable ?? true,
      obscureText: (widget.showPasswordToggleIcon ?? false) == true
          ? _obscureText
          : false,
      autocorrect: false,
      maxLength: widget.maxLength,
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      cursorColor: white,
      onFieldSubmitted: widget.onSubmitted,
      inputFormatters: widget.inputFormatters,
      style: widget.textStyle ?? textFieldTextStyle(),
      readOnly: widget.isReadOnly ?? false,
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
        errorStyle: widget.labelStyle ?? textFieldHintStyle(),
        hintText: widget.hintText ?? '',
        hintStyle: widget.hintTextStyle ?? textFieldHintStyle(),
        labelText: widget.label ?? '',
        labelStyle: widget.labelStyle ?? textFieldHintStyle(),
        suffixIcon: (widget.showPasswordToggleIcon ?? false) == true
            ? InkWell(
                onTap: () {
                  setState(() => _obscureText = !_obscureText);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image(
                      image: AssetImage(!_obscureText
                          ? ImagePath.pwd_show
                          : ImagePath.pwd_hide),
                      width: 5,
                      height: 5,
                      color: widget.suffixIconColor ?? Colors.grey),
                ))
            : widget.suffixIconData != null
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image(
                        image: AssetImage(widget.suffixIconData!),
                        width: 5,
                        height: 5,
                        color: widget.suffixIconColor ?? Colors.grey),
                  )
                : null,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: white),
        ),
      ),
    );
  }
}

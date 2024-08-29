import 'package:flutter/material.dart';

class TextFromFieldWidget extends StatelessWidget {
  const TextFromFieldWidget({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.focusNode,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.validator,
  });

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) => TextFormField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      );
}

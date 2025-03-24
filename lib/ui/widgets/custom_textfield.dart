import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String labelText;
  final String? placeholder;
  final int? minimuLine;
  final int? maximumLine;
  final int? maximumLength;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isobscureText;
  final String? obscureCharacter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign textAlignment;
  final Color? hintColor;
  final Function()? onClick;

  const CustomTextfield(
      {super.key,
        required this.labelText,
        this.placeholder,
        this.minimuLine,
        this.maximumLine,
        this.inputType = TextInputType.text,
        this.isobscureText = false,
        this.obscureCharacter = "*",
        this.prefixIcon,
        this.suffixIcon,
        required this.controller,
        this.textAlignment = TextAlign.start,
        this.maximumLength,
        this.hintColor,
        this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // canRequestFocus: false,
      minLines: minimuLine,
      maxLines: maximumLine,
      maxLength: maximumLength,
      textAlign: textAlignment,
      keyboardType: inputType,
      obscureText: isobscureText,
      obscuringCharacter: obscureCharacter!,
      controller: controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(), // when tap outside the textfield then virtual keyboard will off
      decoration: InputDecoration(
        // label: Text(labelText!),
        fillColor: Colors.white,
        filled: true,
        hintText: placeholder,
        label: Text(labelText),
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(24), bottomLeft: Radius.circular(24)),
          borderSide:
          const BorderSide(width: 1, color: Colors.deepOrangeAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(24), bottomLeft: Radius.circular(24)),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
      onTap: onClick,
    );
  }
}
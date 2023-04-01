import 'package:flutter/material.dart';

class RoundedInput extends StatelessWidget {
  final String hintText;
  final Function(String)? onSubmit;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final bool autoFocus;
  final bool password;

  const RoundedInput({
    super.key,
    this.controller,
    required this.hintText,
    this.onSubmit,
    this.onChange,
    required this.autoFocus,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: password,
        onChanged: onChange,
        autofocus: autoFocus,
        controller: controller,
        decoration: InputDecoration(
          isDense: false,
          labelText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.outline),
          border: InputBorder.none,
          focusedBorder: const UnderlineInputBorder(),
        ),
        onSubmitted: onSubmit);
  }
}

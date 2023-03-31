import 'package:flutter/material.dart';

class RoundedInput extends StatelessWidget {
  final String hintText;
  final Function(String)? onSubmit;
  final TextEditingController? controller;

  const RoundedInput({
    super.key,
    this.controller,
    required this.hintText,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        autofocus: false,
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

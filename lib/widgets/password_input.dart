import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required FocusNode passwordFocusNode,
  }) : _passwordFocusNode = passwordFocusNode, super(key: key);

  final FocusNode _passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      focusNode: _passwordFocusNode,
      decoration:  InputDecoration(
        labelText: 'password'.tr(),
        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
        border: const OutlineInputBorder(),
        fillColor: Colors.blue,
      ),
    );
  }
}

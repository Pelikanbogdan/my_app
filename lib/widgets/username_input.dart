import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({
    Key? key,
    required FocusNode emailFocusNode,
    required FocusNode passwordFocusNode,
  }) : _emailFocusNode = emailFocusNode, _passwordFocusNode = passwordFocusNode, super(key: key);

  final FocusNode _emailFocusNode;
  final FocusNode _passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _emailFocusNode,
      onFieldSubmitted: (_) {
        FocusScope.of(context)
            .requestFocus(_passwordFocusNode);
      },
      decoration:  InputDecoration(
        labelText: 'username'.tr(),
        border: const OutlineInputBorder(),
        fillColor: Colors.blue,
      ),
    );
  }
}
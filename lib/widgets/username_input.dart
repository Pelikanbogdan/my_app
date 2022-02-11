import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({
    Key? key,
    required FocusNode emailFocusNode,
    required FocusNode passwordFocusNode,
    required this.text
  })  : _emailFocusNode = emailFocusNode,
        _passwordFocusNode = passwordFocusNode,
        super(key: key);
  final String text;
  final FocusNode _emailFocusNode;
  final FocusNode _passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.symmetric(vertical: 10
    ),child:Column(
      children: [
        Container(
            alignment: Alignment.centerLeft, 
            child: Text(text.tr(),style: const TextStyle(fontSize: 12,),),
            padding: const EdgeInsets.only(left: 5,bottom: 5,),
            ),
        SizedBox(
          height: 30,

      child: TextFormField(textInputAction: TextInputAction.next,
        focusNode: _emailFocusNode,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        decoration: InputDecoration(
          labelText: text.tr(),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: const TextStyle(fontSize: 12),
          border: const OutlineInputBorder(),
          fillColor: Colors.blue,
        ),
      ),
    )
      ,],),);}
}

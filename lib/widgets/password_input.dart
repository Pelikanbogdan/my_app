import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
    final FocusNode _passwordFocusNode;
  final String text;
  const PasswordInput({
    Key? key,
    required FocusNode passwordFocusNode,required this.text,
  })  : _passwordFocusNode = passwordFocusNode,
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft, 
              child: Text(text.tr(),style: const TextStyle(fontSize: 12,),),
              padding: const EdgeInsets.only(left: 5,bottom:5,),
              ),
          SizedBox(
            height: 30,
            child: TextFormField(
              obscureText: true,
              focusNode: _passwordFocusNode,
              decoration: InputDecoration(
                labelText: text.tr(),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: const TextStyle(fontSize: 12),
                suffixIcon: const Icon(Icons.remove_red_eye_outlined, size: 14),
                border:  const OutlineInputBorder(),
                fillColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

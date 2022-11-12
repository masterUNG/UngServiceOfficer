// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    required this.hint,
    this.suffixWidget,
    this.obscure,
    required this.changeFunc,
  }) : super(key: key);

  final String hint;
  final Widget? suffixWidget;
  final bool? obscure;
  final Function(String) changeFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: TextFormField(onChanged: changeFunc,
        obscureText: obscure ?? false,
        decoration: InputDecoration(
          suffixIcon: suffixWidget,
          hintText: hint,
          filled: true,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

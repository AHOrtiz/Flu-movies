import 'package:flutter/material.dart';

class InputText extends StatefulWidget {

  final  String label;
  final Function(String) validator;

  const InputText({Key key, @required this.label, this.validator}) : super(key: key);
  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        contentPadding: EdgeInsets.symmetric(vertical: 10)
      ),
    );
  }
}
import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatefulWidget {
  TextFormFieldComponent(
      {super.key, required this.controllerText, required this.value});
  String controllerText;
  String value;
  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(text: widget.controllerText),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: 'Rua',
      ),
      onChanged: (value) {
        widget.value = value;
      },
    );
  }
}

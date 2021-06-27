import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  String label;
  IconData prefix;

  DefaultFormField({
    @required this.controller,
    @required this.type,
    @required this.label,
    @required this.prefix,
});

  @override
  Widget build(BuildContext context)
  {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: label,
        prefixIcon: Icon(
          prefix,
        ),
      ),
    );
  }
}
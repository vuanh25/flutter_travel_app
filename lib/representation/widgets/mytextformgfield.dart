import 'package:flutter/material.dart';

 class MyTextFormField extends StatelessWidget
{
  final TextEditingController? controller;
  final String? name;

  const MyTextFormField({super.key, 
    this.controller,
    this.name,
  });
  @override
  Widget build(BuildContext context)
  {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration
      (
        border: const OutlineInputBorder(),
        hintText: name,
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../color_manager.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.hintText,
    required this.validator,
    required this.icon,
    required this.controller,
  });
  final String hintText;
  final String validator;
  final IconData icon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(color: ColorManager.black),
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validator;
          }
          return null;
        },
        maxLines: 1,
        decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: Icon(
            icon,
            color: ColorManager.primary,
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

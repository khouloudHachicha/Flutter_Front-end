import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;

  const MyTextField({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          labelText: label, floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}

class CustomSizedBoxTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final IconData prefixIconData;
  final double height;
  final Icon? suffixIcon;
  final TextEditingController? controller;

  const CustomSizedBoxTextFormField({
    Key? key,
    required this.labelText,
    required this.prefixIconData,
    required this.height,
    this.validator,
    this.suffixIcon,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: SizedBox(
        height: height,
        child: TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            focusColor: Colors.blueAccent,
            fillColor: Colors.blueAccent,
            prefixIcon: Icon(
              prefixIconData,
              color: Colors.white,
            ),
            suffixIcon: suffixIcon,
            label: Text(
              labelText,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
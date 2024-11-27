import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  //final Color labelColor;

  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.labelText,
    required this.icon,
    required this.controller,
    this.obscureText = false,
    this.validator,
    //this.labelColor = Colors.black, // default color if not provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
         // labelStyle: TextStyle(color: labelColor), // Set label color here
          prefixIcon: Icon(icon),
        ),
        validator: validator,
      ),
    );
  }
}

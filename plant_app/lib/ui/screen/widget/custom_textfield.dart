import 'package:flutter/material.dart';
import 'package:plant_app/Constants.dart';

// we cut the widget code and create a file in the widgets folder and paste it here
class CustomTextField extends StatelessWidget {
  // set the passed final parameters of the widget
  final IconData icon;
  final bool obscureText;
  final String hintText;
  const CustomTextField({
    // we add the final parameters to the constructor
    super.key, required this.icon, required this.obscureText, required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: TextStyle(
        color: Constants.blackColors,
      ),
      // replace the hard- coded with the widget parameters
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(icon, color: Constants.blackColors.withOpacity(.3)),
        hintText: hintText
      ),
      cursorColor: Constants.blackColors.withOpacity(.5),
    );
  }
}
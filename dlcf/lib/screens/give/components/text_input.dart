// import 'package:dlcf/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomGiveTextInput extends StatelessWidget {
  final String name;
  final String hintText;
  final double height;
  final double width;
  // final Icon icon;
  const CustomGiveTextInput({
    super.key,
    required this.name,
    required this.hintText,
    required this.height,
    required this.width,
    // required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        constraints: BoxConstraints(
          minHeight: height,
          minWidth: width,
          maxHeight: height,
          maxWidth: width,
        ),
        filled: false,
        hintText: name,
        label: Text(hintText),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}

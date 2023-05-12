import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.name,
    required this.hintText,
    required this.controller,
  });
  final String name;
  final String hintText;
  final TextEditingController controller;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  // ignore: non_constant_identifier_names
  void show_hide_password() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        label: Text(widget.name),
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
        suffixIcon: InkWell(
          onTap: () {
            show_hide_password();
          },
          splashColor: Colors.blue,
          splashFactory: InkSparkle.splashFactory,
          child: _obscureText
              ? const Icon(Icons.visibility_outlined)
              : const Icon(Icons.visibility_off),
        ),
      ),
      obscureText: _obscureText,
    );
  }
}

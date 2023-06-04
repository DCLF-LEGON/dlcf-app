import 'package:flutter/material.dart';

class OtpBox extends StatefulWidget {
  final TextEditingController pinController = TextEditingController();

  OtpBox({
    super.key,
    required pinController,
  });

  @override
  State<OtpBox> createState() => _OtpBoxState();
}

class _OtpBoxState extends State<OtpBox> {
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
      controller: widget.pinController,
      keyboardType: TextInputType.number,
      keyboardAppearance: Brightness.dark,
      maxLength: 1,
      decoration: const InputDecoration(
        constraints: BoxConstraints(
          minHeight: 60,
          minWidth: 50,
          maxHeight: 60,
          maxWidth: 50,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}

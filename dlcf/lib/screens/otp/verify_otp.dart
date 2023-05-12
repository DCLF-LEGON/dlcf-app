import 'package:dlcf/constants/colors.dart';
import 'package:dlcf/screens/otp/components/body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
      ),
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          elevation: 0,
        ),
        body: const Body(),
      ),
    );
  }
}

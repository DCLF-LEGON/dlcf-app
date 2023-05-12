import 'package:dlcf/constants/colors.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:dlcf/screens/give/components/give_success_body2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GiveSuccessful extends StatelessWidget {
  const GiveSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          elevation: 0,
          title: const Text('SUCCESSFUL'),
          centerTitle: true,
        ),
        body: const GiveSuccessBody2(
          network: Networks.mtn,
        ),
      ),
    );
  }
}

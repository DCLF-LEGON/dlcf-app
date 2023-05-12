// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:dlcf/assets.dart';
import 'package:dlcf/constants/colors.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      navigateAfterValidation();
    });
  }

  // check validation in sharepreferences
  // if true, go to home - already logged in
  // if false, go to onboarding - not logged in
  void navigateAfterValidation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    if (isLoggedIn == null) {
      GoRouter.of(context).pushNamed(RouteNames.onboarding);
    } else {
      GoRouter.of(context).pushNamed(RouteNames.home);
    }
  }

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.assetsLogosUgLogo,
                    width: 100,
                    height: 100,
                  ),
                  Image.asset(
                    Assets.assetsLogosDlcfLogo,
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              const SizedBox(height: 150),
              const SpinKitThreeInOut(
                color: Colors.blue,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

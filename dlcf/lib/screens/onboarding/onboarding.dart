import 'package:dlcf/assets.dart';
import 'package:dlcf/constants/colors.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

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
                    Assets.assetsLogosDlcfLogo,
                    width: 100,
                    height: 100,
                  ),
                  Image.asset(
                    Assets.assetsLogosUgLogo,
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text('DLCF-LEGON',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 50),
              Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).pushNamed(RouteNames.signup);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      splashFactory: InkRipple.splashFactory,
                      animationDuration: const Duration(milliseconds: 700),
                      fixedSize: const Size(160, 40),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text('SIGN UP', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).pushNamed(RouteNames.login);
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: primaryColor,
                        width: 2,
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: primaryColor,
                      elevation: 0,
                      splashFactory: InkRipple.splashFactory,
                      animationDuration: const Duration(milliseconds: 700),
                      fixedSize: const Size(160, 40),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text('LOG IN', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

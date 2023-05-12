import 'package:dlcf/constants/colors.dart';
import 'package:dlcf/general/components/password.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController ConfirmPasswordController = TextEditingController();

    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'RESET PASSWORD',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: screenSize.height * 0.75,
            width: screenSize.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 35, right: 35),
                child: Column(
                  children: <Widget>[
                    CustomPasswordField(
                      name: 'New Password',
                      hintText: 'New Password',
                      controller: passwordController,
                    ),
                    const SizedBox(height: 20),
                    CustomPasswordField(
                      name: 'Confirm Password',
                      hintText: 'Confirm Password',
                      controller: ConfirmPasswordController,
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context)
                              .pushNamed(RouteNames.resetpasswordsuccess);
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child:
                              Text('UPDATED', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('Don\'t have an account?'),
                              const SizedBox(width: 5),
                              TextButton(
                                onPressed: () {
                                  GoRouter.of(context)
                                      .pushNamed(RouteNames.signup);
                                },
                                child: const Text('Click here'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

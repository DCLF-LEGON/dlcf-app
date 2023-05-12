import 'package:dlcf/constants/colors.dart';
import 'package:dlcf/general/components/password.dart';
import 'package:dlcf/general/components/text_input.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'LOGIN',
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
                    CustomTextInput(
                        hintText: 'Email',
                        name: 'Email',
                        controller: emailController),
                    const SizedBox(height: 20),
                    CustomPasswordField(
                      name: 'Password',
                      hintText: 'Password',
                      controller: passwordController,
                    ),
                    const SizedBox(height: 20),
                    Row(children: <Widget>[
                      Checkbox(
                          value: true,
                          onChanged: (value) {
                            // ignore: avoid_print
                            print('Print something$value');
                            value = !value!;
                          }),
                      const Text('Remember Me'),
                      const Spacer(),
                      TextButton(
                        child: const Text('Forgot Password?'),
                        onPressed: () {
                          GoRouter.of(context)
                              .pushNamed(RouteNames.resetpassword);
                        },
                      ),
                    ]),
                    const SizedBox(height: 40),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context).pushNamed(RouteNames.home);
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
                          child: Text('Login', style: TextStyle(fontSize: 16)),
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

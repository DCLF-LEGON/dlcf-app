// ignore_for_file: use_build_context_synchronously

import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/constants/colors.dart';
import 'package:dlcf/general/components/password.dart';
import 'package:dlcf/general/components/text_input.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;

  Future<int> login(email, password) async {
    final Uri loginURL = Uri.parse(EndPoints.login);
    final response = await http.post(
      loginURL,
      body: json.encode({
        'username': email,
        'password': password,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print('Login Successful: Code: ${response.statusCode}');
      // save the data using sharedpreferences
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String token = responseData['token'];
      final String name = responseData['user']['fullname'];
      final String email = responseData['user']['email'];
      final dynamic profilePic = responseData['user']['profile_pic'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userToken', token);
      prefs.setBool('isLoggedIn', true);
      prefs.setString('name', name);
      prefs.setString('userEmail', email);
      if (profilePic != null) {
        prefs.setString('profileImage', profilePic);
      }
      return response.statusCode;
    } else if (response.statusCode == 403) {
      // ignore: avoid_print
      print('OTP NOT VERIFIED: Code: ${response.statusCode}');
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String token = responseData['token'];
      final String name = responseData['user']['fullname'];
      final String email = responseData['user']['email'];
      final dynamic profilePic = responseData['user']['profile_pic'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userToken', token);
      prefs.setString('name', name);
      prefs.setString('userEmail', email);
      if (profilePic != null) {
        prefs.setString('profileImage', profilePic);
      }
      return response.statusCode;
    } else {
      // ignore: avoid_print
      print('Login Error: Error Code: ${response.statusCode}');
      return response.statusCode;
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final username = emailController.text;
                          final password = passwordController.text;
                          // check if any of the fields are empty
                          if (username.isEmpty || password.isEmpty) {}
                          // hit endpoint
                          final res = await login(username, password);
                          // stop loading
                          setState(() {
                            isLoading = false;
                          });
                          // check response status
                          if (res == 200) {
                            GoRouter.of(context).pushNamed(RouteNames.home);
                          } else if (res == 403) {
                            GoRouter.of(context)
                                .pushNamed(RouteNames.verifyotp);
                          } else {
                            _showLoginError(context);
                          }
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ))
                              : const Text('Login',
                                  style: TextStyle(fontSize: 16)),
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

  void _showLoginError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          child: SizedBox(
            height: 300,
            width: 300,
            child: Center(child: Text('Could not login! Try Again later')),
          ),
        );
      },
    );
  }
}

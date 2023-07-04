// ignore_for_file: avoid_print

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
  const Body({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;
  Future<int> signUp(name, email, password, confirmPassword) async {
    // Perform your validation checks here before making the API request
    final Uri signUpUrl = Uri.parse(EndPoints.signup);
    print("Hitting the endpoint");
    final response = await http.post(
      signUpUrl,
      body: json.encode({
        'fullname': name,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print("Done hitting the endpoint");
    print("Checking the status");
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String token = responseData['token'];
      final String name = responseData['user']['fullname'];
      final String email = responseData['user']['email'];
      final dynamic profilePic = responseData['user']['profile_pic'];
      final dynamic membershipInfo = responseData['membership_info'];

      print('Signup successful. Token: $token');

      // save the data using sharedpreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userToken', token);
      prefs.setString('name', name);
      prefs.setString('userEmail', email);
      if (profilePic != null) {
        prefs.setString('profileImage', profilePic);
      }
      // save user's membership info if it exists
      if (membershipInfo != null ) {
        prefs.setString('program', membershipInfo['program']);
        prefs.setString('department', membershipInfo['department']);
        prefs.setString('level', membershipInfo['level']);
        prefs.setString('hall', membershipInfo['hall']);
        prefs.setString('room', membershipInfo['room']);
        prefs.setString('phone', membershipInfo['phone']);
        prefs.setString('gender', membershipInfo['gender']);
        prefs.setString('membership_status', 'Completed');
      } else {
        prefs.setString('membership_status', 'Not Completed');
      }
      prefs.setBool('isLoggedIn', true);

      return response.statusCode;
    } else {
      print('Signup failed. Response Code: ${response.statusCode}');
      return response.statusCode;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: screenSize.height * 0.8,
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
                      name: 'Name',
                      hintText: 'Name',
                      controller: nameController,
                    ),
                    const SizedBox(height: 20),
                    CustomTextInput(
                      name: 'Email',
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomPasswordField(
                      name: 'Password',
                      hintText: 'Password',
                      controller: passwordController,
                    ),
                    const SizedBox(height: 20),
                    CustomPasswordField(
                      name: 'Confirm Password',
                      hintText: 'Confirm Password',
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          print("Submit button pressed");
                          // set the loading state to true
                          setState(() {
                            isLoading = true;
                          });

                          print("Getting the input values");
                          final name = nameController.text;
                          final email = emailController.text;
                          final password = passwordController.text;
                          final confirmPassword =
                              confirmPasswordController.text;
                          // check if none of them are empty
                          // make sure none of the fields are empty
                          print("Checking if any of the input is empty");
                          if (name.isEmpty ||
                              email.isEmpty ||
                              password.isEmpty ||
                              confirmPassword.isEmpty) {
                            AlertDialog(
                              title: const Text('Error'),
                              content:
                                  const Text('All Fields Must Be Entered!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    GoRouter.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                            return;
                          }

                          // check of password and confirm password are equal
                          print(
                              "Checking is password and confirm password math");
                          if (password != confirmPassword) {
                            AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Passwords Mismatch!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    GoRouter.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                            return;
                          }

                          // make request
                          print("Calling the SignUp function");
                          int res = await signUp(
                              name, email, password, confirmPassword);
                          // stop loading
                          setState(() {
                            isLoading = false;
                          });
                          // navigate base on status code
                          print("Checking request status");
                          if (res == 201) {
                            // ignore: use_build_context_synchronously
                            GoRouter.of(context)
                                .pushNamed(RouteNames.verifyotp);
                          } else {
                            // ignore: use_build_context_synchronously
                            _showSignUpError(context);
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
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          child: isLoading == true
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                )
                              : const Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 16),
                                ),
                        ),
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

  void _showSignUpError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          child: SizedBox(
            height: 300,
            width: 300,
            child: Center(child: Text('Could not sign up! Try Again later')),
          ),
        );
      },
    );
  }
}

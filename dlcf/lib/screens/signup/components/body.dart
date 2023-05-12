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

  Future<void> signUp() async {
    final String name = nameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    // Perform your validation checks here before making the API request

    final Uri signUpUrl = Uri.parse(EndPoints.signup);

    final BuildContext context =
        this.context; // Store the context in a local variable

    try {
      final response = await http.post(
        signUpUrl,
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String token = responseData['token'];
        final String name = responseData['user']['fullname'];
        final String email = responseData['user']['email'];
        final String profilePic = responseData['user']['profile_pic'];

        print('Signup successful. Token: $token');

        // save the data using sharedpreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        prefs.setString('name', name);
        prefs.setString('email', email);
        prefs.setString('profilePic', profilePic);
        prefs.setBool('isLoggedIn', true);

        GoRouter.of(context).pushNamed(RouteNames.verifyotp);
      } else {
        // Signup failed, handle the error
        print('Signup failed. Response: ${response.body}');
        // Show an error message to the user or handle the error in another way
      }
    } catch (error) {
      // Handle the error
      print('Error occurred during signup: $error');
      // Show an error message to the user or handle the error in another way
    }
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
                        onPressed: signUp,
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
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          child: Text(
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
}



// // ignore_for_file: avoid_print

// import 'package:dlcf/api/endpoints.dart';
// import 'package:dlcf/constants/colors.dart';
// import 'package:dlcf/general/components/password.dart';
// import 'package:dlcf/general/components/text_input.dart';
// import 'package:dlcf/general/routing/nav_config.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   Future<void> signUp() async {
//     final String name = nameController.text;
//     final String email = emailController.text;
//     final String password = passwordController.text;
//     final String confirmPassword = confirmPasswordController.text;

//     // Perform your validation checks here before making the API request

//     final Uri signUpUrl = Uri.parse(EndPoints.signup);

//     try {
//       final response = await http.post(
//         signUpUrl,
//         body: json.encode({
//           'name': name,
//           'email': email,
//           'password': password,
//           'confirmPassword': confirmPassword,
//         }),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('Response status: ${response.statusCode}');
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = json.decode(response.body);
//         final String token = responseData['token'];
//         final String name = responseData['user']['fullname'];
//         final String email = responseData['user']['email'];
//         final String profilePic = responseData['user']['profile_pic'];

//         // save the data using sharedpreferences
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setString('token', token);
//         prefs.setString('name', name);
//         prefs.setString('email', email);
//         prefs.setString('profilePic', profilePic);
//         prefs.setBool('isLoggedIn', true);

//         GoRouter.of(context).pushNamed(RouteNames.verifyotp);
//       } else {
//         // Signup failed, handle the error
//         print('Signup failed. Response: ${response.body}');
//         // Show an error message to the user or handle the error in another way
//       }
//     } catch (error) {
//       // Handle the error
//       print('Error occurred during signup: $error');
//       // Show an error message to the user or handle the error in another way
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;

//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           const Center(
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 30),
//               child: Text(
//                 'SIGN UP',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: screenSize.height * 0.8,
//             width: screenSize.width,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//               color: Colors.white,
//             ),
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 60, left: 35, right: 35),
//                 child: Column(
//                   children: <Widget>[
//                     CustomTextInput(
//                       name: 'Name',
//                       hintText: 'Name',
//                       controller: nameController,
//                     ),
//                     const SizedBox(height: 20),
//                     CustomTextInput(
//                       name: 'Email',
//                       hintText: 'Email',
//                       controller: emailController,
//                     ),
//                     const SizedBox(height: 20),
//                     CustomPasswordField(
//                       name: 'Password',
//                       hintText: 'Password',
//                       controller: passwordController,
//                     ),
//                     const SizedBox(height: 20),
//                     CustomPasswordField(
//                       name: 'Confirm Password',
//                       hintText: 'Confirm Password',
//                       controller: confirmPasswordController,
//                     ),
//                     const SizedBox(height: 50),
//                     Center(
//                       child: ElevatedButton(
//                         onPressed: signUp,
//                         style: ElevatedButton.styleFrom(
//                           side: BorderSide(
//                             color: primaryColor,
//                             width: 2,
//                           ),
//                           backgroundColor: Colors.white,
//                           foregroundColor: primaryColor,
//                           elevation: 0,
//                           splashFactory: InkRipple.splashFactory,
//                           animationDuration: const Duration(milliseconds: 700),
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 30,
//                             vertical: 10,
//                           ),
//                           child: Text(
//                             'Submit',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

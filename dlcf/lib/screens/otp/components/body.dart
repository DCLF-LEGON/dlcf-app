// ignore_for_file: avoid_print

import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/constants/colors.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:dlcf/screens/otp/components/otpbox.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController f1Controller = TextEditingController();
  final TextEditingController f2Controller = TextEditingController();
  final TextEditingController f3Controller = TextEditingController();
  final TextEditingController f4Controller = TextEditingController();

  String userEmail = 'example@gmail.com';
  bool isLoading = false;

  Future<int> verifyOTP(String f1, String f2, String f3, String f4) async {
    final Uri verifyOTPUrl = Uri.parse(EndPoints.verifyOTP);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("userToken");
    final response = await http.post(
      verifyOTPUrl,
      body: json.encode({
        'otp': f1 + f2 + f3 + f4,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Token ${token.toString()}",
      },
    );
    print(f1 + f2 + f3 + f4);
    print(token.toString());
    if (response.statusCode == 200) {
      print("OTP verified");
      return response.statusCode;
    } else {
      print("Error Occured! Code: ${response.statusCode}");
      return response.statusCode;
    }
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  void getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString("userEmail");

    if (email != null) {
      setState(() {
        userEmail = email;
      });
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
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'VERIFY OTP',
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
                    Icon(Icons.email_rounded, size: 80, color: primaryColor),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        const Text(
                            'To confirm your account, enter the 4-digit'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Text>[
                            const Text('code sent to '),
                            Text(
                              userEmail,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // OtpBox(pinController: f1Controller),
                        TextField(
                          controller: f1Controller,
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
                        ),
                        const SizedBox(width: 5),
                        // OtpBox(pinController: f2Controller),
                        TextField(
                          controller: f2Controller,
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
                        ),
                        const SizedBox(width: 5),
                        // OtpBox(pinController: f3Controller),
                        TextField(
                          controller: f3Controller,
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
                        ),
                        const SizedBox(width: 5),
                        // OtpBox(pinController: f4Controller),
                        TextField(
                          controller: f4Controller,
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final f1 = f1Controller.text;
                              final f2 = f2Controller.text;
                              final f3 = f3Controller.text;
                              final f4 = f4Controller.text;
                              // check if any of the fields are empty
                              if (f1.isEmpty ||
                                  f2.isEmpty ||
                                  f3.isEmpty ||
                                  f4.isEmpty) {
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
                              // make request
                              final int res = await verifyOTP(f1, f2, f3, f4);

                              if (res == 200) {
                                // ignore: use_build_context_synchronously
                                GoRouter.of(context)
                                    .pushNamed(RouteNames.otpverified); //noqa
                              } else {
                                // ignore: use_build_context_synchronously
                                _showVerifyOTPError(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              splashFactory: InkRipple.splashFactory,
                              animationDuration:
                                  const Duration(milliseconds: 700),
                              fixedSize: const Size(160, 40),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text('VERIFY',
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                color: primaryColor,
                                width: 2,
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: primaryColor,
                              elevation: 0,
                              splashFactory: InkRipple.splashFactory,
                              animationDuration:
                                  const Duration(milliseconds: 700),
                              fixedSize: const Size(160, 40),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text('RESEND CODE',
                                  style: TextStyle(fontSize: 16)),
                            ),
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

  void _showVerifyOTPError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          child: SizedBox(
            height: 300,
            width: 300,
            child: Center(child: Text('Could not verify OTP! Try Again later')),
          ),
        );
      },
    );
  }
}

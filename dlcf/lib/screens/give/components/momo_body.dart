// ignore_for_file: avoid_print

import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GiveMomoBody extends StatefulWidget {
  final String network;
  const GiveMomoBody({super.key, required this.network});

  @override
  State<GiveMomoBody> createState() => _GiveMomoBodyState();
}

class _GiveMomoBodyState extends State<GiveMomoBody> {
  bool isLoading = false;

  Future<int> makeDonation(
      String phoneNumber, double amount, String network) async {
    // Create the request body
    Map<String, dynamic> requestBody = {
      "amount": amount,
      "network": network,
      "mobile_number": phoneNumber,
    };

    // Convert the request body to JSON
    String requestBodyJson = jsonEncode(requestBody);

    // Make the API call
    final response = await http.post(
      Uri.parse(EndPoints.makeDonation),
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestBodyJson,
    );

    // Check the response status
    if (response.statusCode == 200) {
      // Success, handle the response here if needed
      print('Donation successful!');
      return 200;
    } else {
      // Error occurred, handle the error here if needed
      print('Donation failed with status: ${response.statusCode}');
      return response.statusCode;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                'GIVE MOMO',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Give, and it shall be given unto thee --- (Luke 6:38)'),
            const SizedBox(height: 40),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                filled: false,
                hintText: 'Phone Number',
                prefixIcon: Icon(Icons.phone_android_outlined),
                label: Text('Phone Number'),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
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
            const SizedBox(height: 30),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                filled: false,
                hintText: 'Amount',
                prefixIcon: Icon(Icons.attach_money),
                label: Text('Amount'),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
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
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                // set the loading state to true
                setState(() {
                  isLoading = true;
                });

                // get the phone number and amount
                final phoneNumber = phoneController.text;
                final amount = double.parse(amountController.text);

                // make sure phone number and amount are not empty
                if (phoneNumber.isEmpty ||
                    amountController.text.isEmpty ||
                    amount == 0) {
                  AlertDialog(
                    title: const Text('Error'),
                    content:
                        const Text('Amount and Phone number must be provided!'),
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

                // make the donation
                int res =
                    await makeDonation(phoneNumber, amount, widget.network);
                setState(() {
                  isLoading = false;
                });
                if (res == 200) {
                  // ignore: use_build_context_synchronously
                  GoRouter.of(context).pushNamed(RouteNames.givesuccess);
                } else {
                  // ignore: use_build_context_synchronously
                  _showDonationError(context);
                }
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 0,
                splashFactory: InkRipple.splashFactory,
                animationDuration: const Duration(milliseconds: 700),
                fixedSize: const Size(240, 40),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: isLoading == true
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        'GIVE WITH ${widget.network}',
                        style: const TextStyle(fontSize: 16),
                      ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _showDonationError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          child: SizedBox(
            height: 300,
            width: 300,
            child: Center(child: Text('Could Not Process Payment')),
          ),
        );
      },
    );
  }
}

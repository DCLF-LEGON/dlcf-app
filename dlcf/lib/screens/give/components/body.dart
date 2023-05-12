import 'package:dlcf/general/routing/nav_config.dart';
import 'package:dlcf/screens/give/components/give_alert.dart';
import 'package:dlcf/screens/give/components/text_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GiveBody extends StatelessWidget {
  const GiveBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                'GIVE ONLINE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Give, and it shall be given unto thee --- (Luke 6:38)'),
            const SizedBox(height: 40),
            const TextField(
              decoration: InputDecoration(
                filled: false,
                hintText: 'Card Number',
                prefixIcon: Icon(Icons.credit_card),
                label: Text('Card Number'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                CustomGiveTextInput(
                    hintText: 'MM/YY', name: 'MM/YY', height: 60, width: 90),
                // SizedBox(width: 20),
                CustomGiveTextInput(
                    hintText: 'CVV', name: 'CVV', height: 60, width: 80),
                // SizedBox(width: 20),
                CustomGiveTextInput(
                    hintText: 'AMOUNT', name: 'AMOUNT', height: 60, width: 100),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(RouteNames.givesuccess);
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
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('GIVE', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                showDialog(
                  barrierColor: Colors.black87,
                  context: context,
                  builder: (BuildContext context) {
                    return (const GiveAlertBody());
                  },
                );
              },
              child: const Text('Pay With Mobile Money'),
            ),
          ],
        ),
      ),
    );
  }
}

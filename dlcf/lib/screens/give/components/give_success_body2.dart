// import 'package:dlcf/screens/give/components/give_alert.dart';
// import 'package:dlcf/screens/give/components/text_input.dart';
import 'package:dlcf/constants/colors.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GiveSuccessBody2 extends StatelessWidget {
  final String network;
  const GiveSuccessBody2({super.key, required this.network});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check_circle_rounded, size: 80, color: primaryColor),
            const SizedBox(height: 10),
            Column(
              children: const <Widget>[
                Text('Thank your for giving!'),
                Text(
                  'GOD BLESS YOU!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).pushNamed(RouteNames.home);
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
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text('HOME', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

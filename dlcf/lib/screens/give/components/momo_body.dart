// import 'package:dlcf/screens/give/components/give_alert.dart';
// import 'package:dlcf/screens/give/components/text_input.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GiveMomoBody extends StatelessWidget {
  final String network;
  const GiveMomoBody({super.key, required this.network});

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
            const TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
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
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'GIVE WITH $network',
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
}

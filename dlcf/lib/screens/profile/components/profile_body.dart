import 'package:dlcf/assets.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(Assets.assetsPicturesProfile),
              radius: 60,
            ),
            const SizedBox(height: 15),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bio',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                // GoRouter.of(context).pushNamed(RouteNames.login);
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                elevation: 0,
                splashFactory: InkRipple.splashFactory,
                animationDuration: const Duration(milliseconds: 700),
                fixedSize: const Size(240, 40),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('MANAGE ACCOUNT', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dlcf/constants/colors.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Body extends StatelessWidget {
  const Body({super.key});

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
                'VERIFIED',
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
                    Icon(Icons.check_circle_rounded,
                        size: 80, color: primaryColor),
                    const SizedBox(height: 10),
                    Column(
                      children: const <Widget>[
                        Text('Your account is successfully'),
                        Text(
                          'verified!',
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
                              animationDuration:
                                  const Duration(milliseconds: 700),
                              fixedSize: const Size(160, 40),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text('CONTINUE',
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
}

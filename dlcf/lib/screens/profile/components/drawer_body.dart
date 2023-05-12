import 'package:dlcf/assets.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage(Assets.assetsPicturesProfile),
                      radius: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'John Doh',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Divider(
                  color: Colors.blueGrey,
                  height: 2,
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Icon(Icons.mail, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Saved Messages',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(Icons.book, color: Colors.blue),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(RouteNames.doctrine);
                      },
                      child: const Text(
                        'Bible Doctrines',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.blue),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(RouteNames.aboutus);
                      },
                      child: const Text(
                        'About Us',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(RouteNames.give);
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
                    fixedSize: const Size(150, 40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Give', style: TextStyle(fontSize: 16)),
                        SizedBox(width: 5),
                        Icon(Icons.attach_money_sharp),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Divider(
                  color: Colors.blueGrey,
                  height: 2,
                ),
                const SizedBox(height: 15),
                Row(
                  children: const [
                    Icon(Icons.settings, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Settings',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).pushNamed(RouteNames.login);
                  },
                  splashColor: Colors.blueGrey,
                  child: Row(
                    children: const [
                      Icon(Icons.power_settings_new_outlined,
                          color: Colors.blue),
                      SizedBox(width: 10),
                      Text(
                        'Sign Out',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

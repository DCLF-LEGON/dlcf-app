import 'package:dlcf/assets.dart';
import 'package:flutter/material.dart';

class DrawerBody2 extends StatelessWidget {
  const DrawerBody2({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage(Assets.assetsPicturesProfile),
                  backgroundColor: Colors.white,
                  radius: 40,
                ),
                SizedBox(width: 10),
                Text(
                  'John Doh',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.mail, color: Colors.blue),
            title: const Text('Save Messages',
                style: TextStyle(color: Colors.blue)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.blue),
            title: const Text('Notification',
                style: TextStyle(color: Colors.blue)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.book, color: Colors.blue),
            title: const Text('Bible Doctrine',
                style: TextStyle(color: Colors.blue)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.image, color: Colors.blue),
            title: const Text('Gallery', style: TextStyle(color: Colors.blue)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.people, color: Colors.blue),
            title: const Text('About Us', style: TextStyle(color: Colors.blue)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // GoRouter.of(context).pushNamed(RouteNames.login);
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
    );
  }
}

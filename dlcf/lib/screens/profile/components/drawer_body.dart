// ignore_for_file: use_build_context_synchronously

import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/assets.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({super.key});

  @override
  State<DrawerBody> createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  String _userEmail = 'anonymous@gmail.com';

  Future<int> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('userToken');
    final Uri logouturl = Uri.parse(EndPoints.logout);
    final response = await http.post(
      logouturl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Token ${token.toString()}",
      },
    );

    if (response.statusCode == 204) {
      // ignore: avoid_print
      print("Logout successful");
      prefs.remove('userToken');
      prefs.remove('name');
      prefs.remove('userEmail');
      prefs.remove('profileImage');
      prefs.remove('isLoggedIn');
      return response.statusCode;
    }
    // ignore: avoid_print
    print("Error Occured: Status Code: ${response.statusCode}");
    return response.statusCode;
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // final String? email = prefs.getString("userEmail");
    // final String? profile = prefs.getString("profileImage");
    final String? email = prefs.getString("userEmail");
    setState(() {
      // _userEmail = email.toString();
      _userEmail = email.toString();
    });
  }

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
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(Assets.assetsPicturesProfile),
                      radius: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _userEmail,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
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
                  children: [
                    const Icon(Icons.mail, color: Colors.blue),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(RouteNames.bookmarks);
                      },
                      child: const Text(
                        'Saved Messages',
                        style: TextStyle(color: Colors.blue),
                      ),
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
                    const Icon(Icons.file_present_outlined, color: Colors.blue),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(RouteNames.churchdocuments);
                      },
                      child: const Text(
                        'Church Documents',
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                const Row(
                  children: [
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
                  onTap: () async {
                    final int res = await logout();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    GoRouter.of(context).pushNamed(RouteNames.login);
                    if (res == 204) {
                      prefs.remove('userToken');
                      GoRouter.of(context).pushNamed(RouteNames.login);
                    } else {
                      _showLogoutError(context);
                    }
                  },
                  splashColor: Colors.blueGrey,
                  child: const Row(
                    children: [
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

  void _showLogoutError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          child: SizedBox(
            height: 300,
            width: 300,
            child: Center(child: Text('Something went wrong! Try Again later')),
          ),
        );
      },
    );
  }
}

import 'package:dlcf/assets.dart';
// import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:go_router/go_router.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  // String _userEmail = 'Anonymous@gmail.com';
  String _userName = 'Anonymous User';
  final String _profileImage = Assets.assetsPicturesProfile;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // final String? email = prefs.getString("userEmail");
    // final String? profile = prefs.getString("profileImage");
    final String? name = prefs.getString("name");
    setState(() {
      // _userEmail = email.toString();
      _userName = name.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(_profileImage),
              radius: 60,
            ),
            const SizedBox(height: 15),
            Text(
              _userName,
              style: const TextStyle(
                fontSize: 26,
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
              'In Christ, we are made new creations, with transformed hearts and minds, reflecting His grace and truth to the world.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '-- Beth Moore',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "Coming Soon!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    backgroundColor: Colors.blue,
                    fontSize: 16.0);
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

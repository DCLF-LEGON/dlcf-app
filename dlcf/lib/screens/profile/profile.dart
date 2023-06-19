import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/screens/profile/components/drawer_body.dart';
import 'package:dlcf/screens/profile/components/profile_body.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('PROFILE'),
          centerTitle: true,
          elevation: 0,
        ),
        drawer: const SafeArea(child: DrawerBody()),
        body: const ProfileBody(),
        bottomNavigationBar: CustomBottomNav(selectedTab: 4),
      ),
    );
  }
}

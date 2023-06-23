// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MembersshipInfoDetailScreen extends StatefulWidget {
  const MembersshipInfoDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MembersshipInfoDetailScreen> createState() =>
      MembersshipInfoDetailScreenState();
}

class MembersshipInfoDetailScreenState
    extends State<MembersshipInfoDetailScreen> {
  String program = '';
  String department = '';
  String level = '';
  String hall = '';
  String room = '';
  String phone = '';
  String gender = '';
  bool isDeleting = false;

  @override
  void initState() {
    super.initState();
    getMembershipInfo();
  }

  getMembershipInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      program = prefs.getString("program").toString();
      department = prefs.getString("department").toString();
      level = prefs.getString("level").toString();
      hall = prefs.getString("hall").toString();
      room = prefs.getString("room").toString();
      phone = prefs.getString('phone').toString();
      gender = prefs.getString('gender').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership Info Detail'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          child: Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Membership Info',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Program",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    program,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Department",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    department,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Level",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    level,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Hall",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    hall,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Room Number",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    room,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Phone",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    phone,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Gender",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    gender,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(selectedTab: 4),
    );
  }
}

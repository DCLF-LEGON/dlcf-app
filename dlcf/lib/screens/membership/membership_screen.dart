// ignore_for_file: avoid_print

import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MembershipFormScreen extends StatefulWidget {
  const MembershipFormScreen({super.key});

  @override
  State<MembershipFormScreen> createState() => _MembershipFormScreenState();
}

class _MembershipFormScreenState extends State<MembershipFormScreen> {
  String program = '';
  String department = '';
  String level = '';
  String hall = '';
  String room = '';
  String phone = '';
  String gender = '';

  @override
  void initState() {
    super.initState();
    getMembershipInfo();
  }

  void getMembershipInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      program = prefs.getString("program").toString();
      department = prefs.getString("department").toString();
      level = prefs.getString("level").toString();
      hall = prefs.getString("hall").toString();
      room = prefs.getString("room").toString();
      phone = prefs.getString("phone").toString();
      gender = prefs.getString("gender").toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership Form'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: MyCustomForm(
          program: program,
          department: department,
          level: level,
          hall: hall,
          room: room,
          phone: phone,
          gender: gender,
        ),
      ),
      bottomNavigationBar: CustomBottomNav(selectedTab: 4),
    );
  }
}


// Create a Form widget.
// ignore: must_be_immutable
class MyCustomForm extends StatefulWidget {
  String program;
  String department;
  String level;
  String hall;
  String room;
  String phone;
  final String gender;
  MyCustomForm({
    super.key,
    required this.program,
    required this.department,
    required this.level,
    required this.hall,
    required this.room,
    required this.phone,
    required this.gender,
  });

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  widget.program = value;
                });
              },
              // controller: programController,
              initialValue: widget.program,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Program',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  widget.department = value;
                });
              },
              // controller: departmentController,
              initialValue: widget.department,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Department',
              ),
            ),
            DropdownButtonFormField(
              value: 'Level 100',
              decoration: const InputDecoration(
                labelText: 'Level',
              ),
              items: const <String>[
                'Level 100',
                'Level 200',
                'Level 300',
                'Level 400',
                'Level 500',
                'Level 600',
                'Msc.',
                'Mphil',
                'PhD',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.level = newValue!;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            DropdownButtonFormField(
              value: 'Non-Resident',
              decoration: const InputDecoration(
                labelText: 'Hall',
              ),
              items: const <String>[
                'Akuafo Hall',
                'Legon Hall',
                'Sarbah Hall',
                'Commo Wealth Hall',
                'Vikings Hostel',
                'Liman Hall',
                'Kwarpong Hall',
                'Sey Hall',
                'Nelson Hall',
                'Pent Hall',
                'TF Hall',
                'Bani Hall',
                'Non-Resident',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.hall = newValue!;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  widget.room = value;
                });
              },
              // controller: roomController,
              initialValue: widget.room,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Room Number',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  widget.phone = value;
                });
              },
              // controller: phoneController,
              initialValue: widget.phone,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
            ),
            CheckboxListTile(
              title: const Text('I agree to the terms and conditions'),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  // print out the various values
                  print(widget.program);
                  print(widget.department);
                  print(widget.level);
                  print(widget.hall);
                  print(widget.room);
                  print(widget.phone);
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Saving Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

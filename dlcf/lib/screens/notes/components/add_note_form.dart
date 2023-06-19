// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AddNoteFormScreen extends StatefulWidget {
  const AddNoteFormScreen({super.key});

  @override
  State<AddNoteFormScreen> createState() => _AddNoteFormScreenState();
}

class _AddNoteFormScreenState extends State<AddNoteFormScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: MyCustomForm(),
      ),
      bottomNavigationBar: CustomBottomNav(selectedTab: 2),
    );
  }
}

// Create a Form widget.
// ignore: must_be_immutable
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({
    super.key,
  });

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Future<int> saveNote(String title, String note) async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("userToken");
    final Uri loginURL = Uri.parse(EndPoints.addGeneralNote);
    final response = await http.post(
      loginURL,
      body: json.encode({
        'title': title,
        'note': note,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Token ${token.toString()}",
      },
    );
    setState(() {
      isLoading = false;
    });
    print(response.reasonPhrase);
    return response.statusCode;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController noteController = TextEditingController();

    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: noteController,
              maxLines: 10,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Add Note',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () async {
                  // print out the various values
                  print(titleController.text);
                  print(noteController.text);
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    final String title = titleController.text;
                    final String note = noteController.text;

                    final int res = await saveNote(title, note);
                    if (res == 200 || res == 201) {
                      GoRouter.of(context).pushNamed(RouteNames.notes); //noqa
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Error Saving Note')),
                      );
                    }
                  }
                },
                child: isLoading
                    ? const LinearProgressIndicator()
                    : const Text('Save Note'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

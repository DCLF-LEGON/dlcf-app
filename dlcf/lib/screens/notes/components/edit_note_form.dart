// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class EditNoteFormScreen extends StatefulWidget {
  final String noteID;
  final String title;
  final String note;
  const EditNoteFormScreen(
      {super.key,
      required this.noteID,
      required this.title,
      required this.note});

  @override
  State<EditNoteFormScreen> createState() => _EditNoteFormScreenState();
}

class _EditNoteFormScreenState extends State<EditNoteFormScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
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
          noteID: widget.noteID,
          title: widget.title,
          note: widget.note,
        ),
      ),
      bottomNavigationBar: CustomBottomNav(selectedTab: 2),
    );
  }
}

// Create a Form widget.
// ignore: must_be_immutable
class MyCustomForm extends StatefulWidget {
  final String noteID;
  late String title;
  late String note;
  MyCustomForm({
    super.key,
    required this.noteID,
    required this.title,
    required this.note,
  });

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Future<int> editNote(int noteID, String title, String note) async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("userToken");
    final Uri editNoteURL = Uri.parse(EndPoints.addGeneralNote);
    final response = await http.put(
      editNoteURL,
      body: json.encode({
        'note_id': noteID,
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
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              // controller: titleController,
              initialValue: widget.title,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              onChanged: (value) {
                setState(() {
                  widget.title = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
                // controller: noteController,
                initialValue: widget.note,
                maxLines: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Edit Note',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    widget.note = value;
                  });
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    final int res = await editNote(
                      int.parse(widget.noteID),
                      widget.title,
                      widget.note,
                    );
                    if (res == 200 || res == 201) {
                      GoRouter.of(context).pushNamed(RouteNames.notes); //noqa
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Error Editting Note')),
                      );
                    }
                  }
                },
                child: isLoading
                    ? const LinearProgressIndicator()
                    : const Text('Edit Note'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

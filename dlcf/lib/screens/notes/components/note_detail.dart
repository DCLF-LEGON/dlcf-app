// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NoteDetailScreen extends StatefulWidget {
  final String id;
  final String title;
  final String note;
  final String createdAt;
  const NoteDetailScreen({
    Key? key,
    required this.id,
    required this.title,
    required this.note,
    required this.createdAt,
  }) : super(key: key);

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  bool isDeleting = false;

  Future<int> deleteNote(int id) async {
    setState(() {
      isDeleting = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("userToken");
    final Uri loginURL = Uri.parse(EndPoints.deleteNote);
    final response = await http.delete(
      loginURL,
      body: json.encode({
        'note_id': int.parse(widget.id),
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Token ${token.toString()}",
      },
    );
    setState(() {
      isDeleting = false;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Note Content",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.note,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Date Created",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.createdAt,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(selectedTab: 2),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          // ensure disable edit button when delete button is clicked
          onPressed: isDeleting ? null : () {},
          backgroundColor: Colors.blue,
          child: const Icon(Icons.edit, color: Colors.white),
        ),
        const SizedBox(height: 15),
        FloatingActionButton(
          onPressed: () async {
            final int statusCode = await deleteNote(int.parse(widget.id));
            if (statusCode == 200) {
              GoRouter.of(context).pushNamed(RouteNames.notes);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Error Deleting Note"),
                ),
              );
            }
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
      ]),
    );
  }
}

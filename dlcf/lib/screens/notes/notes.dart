// ignore_for_file: avoid_print

import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  String text = '';
  var control = TextEditingController();
  List<dynamic> filteredNotes = [];
  bool isLoading = false;

  List<dynamic> notesList = []; // list of initial notes

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  getNotes() async {
    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("userToken");

    var response = await http.get(
      Uri.parse(EndPoints.generalNotes),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Token ${token.toString()}",
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        notesList = data['notes'];
        isLoading = false;
      });
      _filterNotes(); // Filter notesList initially
      print(notesList[0]['created_at']);
      return response.statusCode;
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      setState(() {
        isLoading = false;
      });
      return response.statusCode;
    }
  }

  // Method to filter notesList based on user input
  void _filterNotes() {
    setState(() {
      filteredNotes = notesList
          .where((note) => note['title']
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).pushNamed(RouteNames.home);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.blue,
          title: Text('notes'.toUpperCase()),
          centerTitle: true,
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 20, right: 20, bottom: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
                        filled: false,
                        hintText: 'Search',
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          text = value;
                        });
                        _filterNotes(); // Update filtered notesList on user input
                      },
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: ListView.builder(
                          itemCount: filteredNotes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Slidable(
                                    key: Key(
                                        filteredNotes[index]['id'].toString()),
                                    actionPane:
                                        const SlidableDrawerActionPane(),
                                    actionExtentRatio: 0.25,
                                    secondaryActions: <Widget>[
                                      IconSlideAction(
                                        caption: 'Delete',
                                        color: Colors.red,
                                        icon: Icons.delete,
                                        onTap: () {
                                          setState(() {
                                            filteredNotes.removeAt(index);
                                          });
                                        },
                                      ),
                                    ],
                                    child: InkWell(
                                      onTap: () {
                                        GoRouter.of(context).pushNamed(
                                          RouteNames.notedetail,
                                          params: {
                                            'id': filteredNotes[index]['id']
                                                .toString(),
                                            'title': filteredNotes[index]
                                                ['title'],
                                            'note': filteredNotes[index]
                                                ['note'],
                                            'createdAt': filteredNotes[index]
                                                ['created_at'],
                                          },
                                        );
                                      },
                                      child: Card(
                                        child: ListTile(
                                          title: Text(
                                            filteredNotes[index]['title'],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(filteredNotes[index]
                                              ['created_at']),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    if (filteredNotes.isEmpty)
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.note,
                            size: 80,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'No Notes',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Tap on \'+\' to add new note',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
        bottomNavigationBar: CustomBottomNav(selectedTab: 2),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).pushNamed(RouteNames.addnote);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

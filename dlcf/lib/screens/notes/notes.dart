import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:dlcf/screens/notes/components/add_note.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  bool isLoading = false;
  bool isAddingNote = false;

  final List<dynamic> notesList = [
    'Slide Left To Delete',
  ]; // list of initial notes

  Future<int> addNote(String title, String description) async {
    setState(() {
      notesList.add(title);
    });
    return Future.value(1);
  }

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  getNotes() async {}

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
        body: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
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
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: notesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: Slidable(
                              key: Key(notesList[index]),
                              actionPane: const SlidableDrawerActionPane(),
                              actionExtentRatio: 0.25,
                              secondaryActions: <Widget>[
                                IconSlideAction(
                                  caption: 'Delete',
                                  color: Colors.red,
                                  icon: Icons.delete,
                                  onTap: () {
                                    setState(() {
                                      notesList.removeAt(index);
                                    });
                                  },
                                ),
                              ],
                              child: Card(
                                child: ListTile(
                                  title: Text(notesList[index]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              if (notesList.isEmpty)
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
            showDialog(
              barrierColor: Colors.black87,
              context: context,
              builder: (BuildContext context) {
                return (const AddNoteBody());
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

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
  final List<String> notesList = [
    'Slide left to delete',
  ]; // list of initial notes

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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.note,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'No notes',
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



// import 'package:dlcf/general/components/bottom_nav.dart';
// import 'package:dlcf/screens/notes/components/add_note.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class Notes extends StatelessWidget {
//   const Notes({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               GoRouter.of(context).pop();
//             },
//           ),
//           elevation: 0,
//           backgroundColor: Colors.blue,
//           title: Text('notes'.toUpperCase()),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding:
//               const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 100),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               const TextField(
//                 decoration: InputDecoration(
//                   filled: false,
//                   hintText: 'Search',
//                   suffixIcon: Icon(Icons.search),
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 15,
//                     vertical: 10,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   hintStyle: TextStyle(
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: 0, // replace with actual note count
//                   itemBuilder: (context, index) => Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       child: ListTile(
//                         title: Text('Note $index'),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               if (0 == 0) // replace with actual note count
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Icon(
//                       Icons.note,
//                       size: 80,
//                       color: Colors.grey,
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'No notes',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                     Text(
//                       'Tap on \'+\' to add new note',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: CustomBottomNav(selectedTab: 2),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//               barrierColor: Colors.black87,
//               context: context,
//               builder: (BuildContext context) {
//                 return (const AddNoteBody());
//               },
//             );
//           },
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }



// // import 'package:dlcf/general/components/bottom_nav.dart';
// // import 'package:dlcf/screens/notes/components/add_note.dart';
// // import 'package:flutter/material.dart';
// // import 'package:go_router/go_router.dart';

// // class Notes extends StatelessWidget {
// //   const Notes({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //           backgroundColor: Colors.white,
// //           appBar: AppBar(
// //             leading: IconButton(
// //               icon: const Icon(Icons.arrow_back),
// //               onPressed: () {
// //                 GoRouter.of(context).pop();
// //               },
// //             ),
// //             elevation: 0,
// //             backgroundColor: Colors.blue,
// //             title: Text('notes'.toUpperCase()),
// //             centerTitle: true,
// //           ),
// //           body: Padding(
// //             // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
// //             padding: const EdgeInsets.only(
// //                 top: 15, left: 20, right: 20, bottom: 100),
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: <Widget>[
// //                 const TextField(
// //                   decoration: InputDecoration(
// //                     filled: false,
// //                     hintText: 'Search',
// //                     suffixIcon: Icon(Icons.search),
// //                     contentPadding: EdgeInsets.symmetric(
// //                       horizontal: 15,
// //                       vertical: 10,
// //                     ),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.all(
// //                         Radius.circular(10),
// //                       ),
// //                     ),
// //                     hintStyle: TextStyle(
// //                       color: Colors.grey,
// //                     ),
// //                   ),
// //                 ),
// //                 // const SizedBox(height: 10),
// //                 Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: const [
// //                     Text(
// //                       'No notes',
// //                       style: TextStyle(
// //                         fontSize: 16,
// //                       ),
// //                     ),
// //                     Text(
// //                       'Tap on \'+\' to add new note',
// //                       style: TextStyle(
// //                         fontSize: 16,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //           bottomNavigationBar: CustomBottomNav(selectedTab: 2),
// //           floatingActionButton: FloatingActionButton(
// //             onPressed: () {
// //               showDialog(
// //                 barrierColor: Colors.black87,
// //                 context: context,
// //                 builder: (BuildContext context) {
// //                   return (const AddNoteBody());
// //                 },
// //               );
// //             },
// //             child: const Icon(Icons.add),
// //           )),
// //     );
// //   }
// // }

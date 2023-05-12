import 'package:dlcf/general/components/text_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNoteBody extends StatelessWidget {
  const AddNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController bodyController = TextEditingController();

    // ignore: sized_box_for_whitespace
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      child: AlertDialog(
        title: const Text('Add Note'),
        scrollable: true,
        content: Container(
          height: 250,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            children: <Widget>[
              CustomTextInput(
                hintText: 'Title',
                name: 'Title',
                controller: titleController,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: bodyController,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Note',
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}


// class AddNoteBody extends StatelessWidget {
//   const AddNoteBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Enter Note Details'),
//       scrollable: true,
//       content: Container(
//         height: 250,
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: const <Widget>[
//             CustomTextInput(hintText: 'Title', name: 'Title'),
//             SizedBox(height: 20),
//             TextField(
//               maxLines: 5,
//               keyboardType: TextInputType.multiline,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Enter Note',
//               ),
//             )
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             GoRouter.of(context).pop();
//           },
//           child: const Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () {
//             GoRouter.of(context).pop();
//           },
//           child: const Text('Save'),
//         ),
//       ],
//     );
//   }
// }

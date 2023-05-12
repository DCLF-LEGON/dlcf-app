import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String name;
  final String hintText;
  final TextEditingController controller;

  const CustomTextInput({
    Key? key,
    required this.name,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Assign the provided controller to the TextField
      decoration: InputDecoration(
        filled: false,
        hintText: name,
        labelText: hintText, // Use labelText instead of label (deprecated)
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}





// // import 'package:dlcf/constants/colors.dart';
// import 'package:flutter/material.dart';

// class CustomTextInput extends StatelessWidget {
//   final String name;
//   final String hintText;
//   // final Icon icon;
//   const CustomTextInput({
//     super.key,
//     required this.name,
//     required this.hintText,
//     // required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         filled: false,
//         hintText: name,
//         label: Text(hintText),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 10,
//         ),
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//         hintStyle: const TextStyle(
//           color: Colors.grey,
//         ),
//       ),
//     );
//   }
// }

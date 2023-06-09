import 'package:flutter/material.dart';

class ChannelBox extends StatelessWidget {
  final int id;
  final String name;
  final String thumbnail;
  const ChannelBox({
    super.key,
    required this.name,
    required this.thumbnail,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(thumbnail), fit: BoxFit.cover),
          color: Colors.blue,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
        ),
      ),
      Positioned(
          bottom: 4,
          child: Center(
            child: Container(
              height: 40,
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              color: const Color.fromARGB(80, 0, 0, 255),
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ))
    ]);
  }
}

import 'package:flutter/material.dart';

class GodsGeneralsContainer extends StatelessWidget {
  // required params
  final String title;
  final String preacher;
  final String url;
  final String description;
  final String thumbnailUrl;
  const GodsGeneralsContainer({
    Key? key,
    required this.title,
    required this.preacher,
    required this.url,
    required this.description,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxWidth = MediaQuery.of(context).size.width / 3;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 120,
      width: boxWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

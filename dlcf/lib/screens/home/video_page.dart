import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/screens/home/components/video_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VideoScreen extends StatelessWidget {
  final String title;
  final String preacher;
  final String url;
  final String description;
  final String thumbnailUrl;
  const VideoScreen({
    super.key,
    required this.title,
    required this.preacher,
    required this.url,
    required this.description,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
          title: Text(title.toUpperCase()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: VideoBody(
              url: url,
              description: description,
              preacher: preacher,
              thumbnailUrl: thumbnailUrl,
              title: title,
              isLive: false,
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNav(selectedTab: 0),
      ),
    );
  }
}

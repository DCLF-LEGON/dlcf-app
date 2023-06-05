import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/screens/home/youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class VideoBody extends StatefulWidget {
  final String title;
  final String preacher;
  final String url;
  final String description;
  final String thumbnailUrl;
  const VideoBody({
    super.key,
    required this.title,
    required this.preacher,
    required this.url,
    required this.description,
    required this.thumbnailUrl,
  });

  @override
  State<VideoBody> createState() => _VideoBodyState();
}

class _VideoBodyState extends State<VideoBody> {
  Future<int> likeyoutubevideo(String videoId) async {
    final Uri likeVideoURL = Uri.parse(EndPoints.likeVideo);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("userToken");
    final response = await http.post(
      likeVideoURL,
      body: json.encode({
        'video_id': videoId,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Token ${token.toString()}",
      },
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print('Video Liked Successfully. Status Code: ${response.statusCode}');
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          // child: VideoPlayerWidget(videoUrl: url),
          child: MessagePlayer(vidUrl: widget.url),
        ),
        const SizedBox(height: 10),
        Text(
          widget.title.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          widget.preacher,
        ),
        const SizedBox(height: 20),
        Text(
          widget.description,
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "Bookmarked",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        backgroundColor: Colors.blue,
                        fontSize: 16.0);
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.bookmark),
                  ),
                ),
                const Text('Bookmark'),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () async {
                    final res = await likeyoutubevideo(widget.url);
                    if (res == 200) {
                      Fluttertoast.showToast(
                        msg: "Liked",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        backgroundColor: Colors.blue,
                        fontSize: 16.0,
                      );
                      return;
                    } else {
                      Fluttertoast.showToast(
                        msg: "Error",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        backgroundColor: Colors.red,
                        fontSize: 16.0,
                      );
                      return;
                    }
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.thumb_up),
                  ),
                ),
                const Text('Like'),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "Coming Soon!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        backgroundColor: Colors.greenAccent[500],
                        fontSize: 16.0);
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.add_comment),
                  ),
                ),
                const Text('Add Notes'),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "Coming Soon!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        backgroundColor: Colors.greenAccent[500],
                        fontSize: 16.0);
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.share_outlined),
                  ),
                ),
                const Text('Share'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

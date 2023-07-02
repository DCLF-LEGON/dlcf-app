// ignore_for_file: avoid_print

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
  final bool isLive;
  final String videoID;
  const VideoBody({
    super.key,
    required this.title,
    required this.preacher,
    required this.url,
    required this.description,
    required this.thumbnailUrl,
    this.isLive = false,
    this.videoID = '',
  });

  @override
  State<VideoBody> createState() => _VideoBodyState();
}

class _VideoBodyState extends State<VideoBody> {
  bool isLiking = false;
  bool isBookmarking = false;

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
      print('Video Liked Successfully. Status Code: ${response.statusCode}');
      return response.statusCode;
    } else {
      print('ERROR OCCURED: CODE: ${response.statusCode}');
      return response.statusCode;
    }
  }

  Future<int> bookmarkYoutubeVideo(String videoId) async {
    final Uri bookmarkVideoURL = Uri.parse(EndPoints.bookmarkVideo);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("userToken");
    final response = await http.post(
      bookmarkVideoURL,
      body: json.encode({
        'video_id': videoId,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Token ${token.toString()}",
      },
    );
    if (response.statusCode == 200) {
      print(
          'Video BOOKMARKED Successfully. Status Code: ${response.statusCode}');
      return response.statusCode;
    } else {
      print('ERROR OCCURED: CODE: ${response.statusCode}');
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
          child: MessagePlayer(
            vidUrl: widget.url,
            isLive: widget.isLive,
            videoID: widget.videoID,
          ),
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
                  onTap: () async {
                    // load
                    setState(() {
                      isBookmarking = true;
                    });
                    final res = await bookmarkYoutubeVideo(widget.url);
                    // stop loading
                    setState(() {
                      isBookmarking = false;
                    });
                    if (res == 200) {
                      Fluttertoast.showToast(
                        msg: "Saved!",
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
                  child: CircleAvatar(
                    radius: 25,
                    child: isBookmarking
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Icon(Icons.bookmark),
                  ),
                ),
                const Text('Bookmark'),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () async {
                    setState(() {
                      isLiking = true;
                    });
                    final res = await likeyoutubevideo(widget.url);
                    setState(() {
                      isLiking = false;
                    });
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
                  child: CircleAvatar(
                    radius: 25,
                    child: isLiking
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Icon(Icons.thumb_up),
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

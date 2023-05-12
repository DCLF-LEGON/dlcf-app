import 'package:dlcf/screens/home/youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VideoBody extends StatelessWidget {
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
          child: MessagePlayer(vidUrl: url),
        ),
        const SizedBox(height: 10),
        Text(
          title.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          preacher,
        ),
        const SizedBox(height: 20),
        Text(
          description,
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
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "Liked",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        backgroundColor: Colors.blue,
                        fontSize: 16.0);
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

// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/screens/home/components/video_body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LiveStreamBody extends StatefulWidget {
  const LiveStreamBody({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LiveStreamBodyState createState() => _LiveStreamBodyState();
}

class _LiveStreamBodyState extends State<LiveStreamBody> {
  Map<String, dynamic> streamData = {};
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchLiveStreamData();
  }

  fetchLiveStreamData() async {
    setState(() {
      isLoading = true;
    });

    //  fetch stream data
    final Uri getStreamURL = Uri.parse(EndPoints.getLiveStream);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final String? token = prefs.getString("userToken");
    final response = await http.get(
      getStreamURL,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      print('STREAM VIDEO FETCHED: ${response.statusCode}');
      setState(() {
        streamData = json.decode(response.body)['stream'];
      });
      print('STREAM DATA: $streamData');
      return response.statusCode;
    } else {
      print('ERROR OCCURED: CODE: ${response.statusCode}');
      return response.statusCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : streamData.isNotEmpty
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: VideoBody(
                    title: streamData['title'],
                    url: streamData['url'],
                    description: streamData['description'],
                    preacher: streamData['preacher'],
                    thumbnailUrl: '',
                    videoID: streamData['video_id'],
                    isLive: true,
                  ),
                )
              : const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.live_tv_rounded,
                        size: 70,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No Live Stream Available',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

import 'dart:convert';

import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/api/models.dart';
import 'package:dlcf/screens/discover/components/suggestion_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChannelMessagesBody extends StatefulWidget {
  const ChannelMessagesBody({super.key});

  @override
  State<ChannelMessagesBody> createState() => _ChannelMessagesBodyState();
}

class _ChannelMessagesBodyState extends State<ChannelMessagesBody> {
  // ignore: unused_field
  bool _isSearching = false;
  String text = '';
  var control = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  initState() {
    super.initState();

    _getMessages();
  }

  _getMessages() async {
    setState(() {
      _isSearching = true;
    });

    var response = await http.get(Uri.parse(EndPoints.youtubevideos));

    setState(() {
      messages = json.decode(response.body)['videos'];
      // ignore: avoid_print
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    List<YoutubeMessage> suggestions = [
      YoutubeMessage(
        id: 1,
        title: "The Power of Gratitude",
        preacher: "John Doe",
        thumbnailUrl: "https://example.com/image1.jpg",
        description:
            "In this sermon, we explore the transformative power of gratitude in our lives.",
        video_id: "n_FIQxyWkWc",
      ),
      YoutubeMessage(
        id: 2,
        title: "Overcoming Fear and Anxiety",
        preacher: "Jane Smith",
        thumbnailUrl: "https://example.com/image2.jpg",
        description:
            "Join us as we learn how to overcome fear and anxiety with faith and courage.",
        video_id: "GkJz8QfCOmA",
      ),
      YoutubeMessage(
        id: 3,
        title: "Living a Life of Purpose",
        preacher: "Mark Johnson",
        thumbnailUrl: "https://example.com/image3.jpg",
        description:
            "Discover the keys to living a life of purpose and fulfillment in this inspiring sermon.",
        video_id: "ippQJgBCXjk",
      ),
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Quick Search',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
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
          const SizedBox(height: 10),
          messages.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return SuggestionBox(
                      title: messages[index]['title'],
                      preacher: messages[index]['preacher'] ??
                          'Pastor Dr. W. F. Kumuyi',
                      thumbnailUrl: messages[index]['thumbnailUrl'],
                      description: messages[index]['description'],
                      url: messages[index]['url'],
                    );
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(height: 50),
                      Icon(
                        Icons.not_interested,
                        size: 40,
                        color: Colors.grey,
                      ),
                      Text(
                        'No Suggestions Found',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

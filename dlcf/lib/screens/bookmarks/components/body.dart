// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/screens/bookmarks/components/suggestion_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkBody extends StatefulWidget {
  const BookmarkBody({Key? key}) : super(key: key);

  @override
  State<BookmarkBody> createState() => _BookmarkBodyState();
}

class _BookmarkBodyState extends State<BookmarkBody> {
  bool isLoading = false;
  String text = '';
  var control = TextEditingController();
  List<dynamic> messages = [];
  List<dynamic> filteredMessages = []; // New list to store filtered messages

  @override
  void initState() {
    super.initState();
    _getMessages();
  }

  _getMessages() async {
    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("userToken");

    var response = await http.get(
      Uri.parse(EndPoints.bookmarkedYoutubeVideos),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Token ${token.toString()}",
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        messages = data['videos'];
        isLoading = false;
      });
      _filterMessages(); // Filter messages initially
    } else {
      print('API request failed with status code: ${response.statusCode}');
      print(response.reasonPhrase);
      setState(() {
        isLoading = false;
      });
    }
  }

  // Method to filter messages based on user input
  void _filterMessages() {
    setState(() {
      filteredMessages = messages
          .where((message) => message['video']['title']
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Search Bookmarks',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: const InputDecoration(
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
            onChanged: (value) {
              setState(() {
                text = value;
              });
              _filterMessages(); // Update filtered messages on user input
            },
          ),
          const SizedBox(height: 10),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : filteredMessages.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredMessages.length,
                      itemBuilder: (context, index) {
                        final preacher =
                            filteredMessages[index]['video']['preacher'];
                        final preacherName = preacher != null
                            ? preacher['video']['title'] +
                                '. ' +
                                preacher['name']
                            : 'Pastor Dr. W. F. Kumuyi';
                        return SuggestionBox(
                          title: filteredMessages[index]['video']['title'],
                          preacher: preacherName,
                          thumbnailUrl: filteredMessages[index]['video']
                              ['thumbnail_url'],
                          description: filteredMessages[index]['video']
                              ['description'],
                          url: filteredMessages[index]['video']['video_id'],
                        );
                      },
                    )
                  : const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50),
                          Icon(
                            Icons.not_interested,
                            size: 40,
                            color: Colors.grey,
                          ),
                          Text(
                            'No Messages Found',
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

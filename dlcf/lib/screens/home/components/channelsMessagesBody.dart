// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/screens/discover/components/suggestion_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChannelMessagesBody extends StatefulWidget {
  final String channelName;
  final String channelID;
  const ChannelMessagesBody({
    super.key,
    required this.channelName,
    required this.channelID,
  });

  @override
  State<ChannelMessagesBody> createState() => _ChannelMessagesBodyState();
}

class _ChannelMessagesBodyState extends State<ChannelMessagesBody> {
  // ignore: unused_field
  bool isLoading = false;
  String text = '';
  var control = TextEditingController();
  List<dynamic> messages = [];
  List<dynamic> filteredMessages = []; // New list to store filtered messages

  @override
  initState() {
    super.initState();

    _getMessages();
  }

  _getMessages() async {
    setState(() {
      isLoading = true;
    });

    final Uri url = Uri.parse(EndPoints.categoryVideos);
    var response = await http.post(
      url,
      body: json.encode({
        'category_id': int.parse(widget.channelID),
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      setState(() {
        messages = json.decode(response.body)['messages'];
      });
    } else {
      print("ERROR FETCHING CATEGORY MESSAGES: CODE: ${response.statusCode}");
    }
  }

  // Method to filter messages based on user input
  void _filterMessages() {
    setState(() {
      filteredMessages = messages
          .where((message) => message['title']
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
            'Quick Search',
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
                        final preacher = filteredMessages[index]['preacher'];
                        final preacherName = preacher != null
                            ? preacher['title'] + '. ' + preacher['name']
                            : 'Pastor Dr. W. F. Kumuyi';
                        return SuggestionBox(
                          title: filteredMessages[index]['title'],
                          preacher: preacherName,
                          thumbnailUrl: filteredMessages[index]
                              ['thumbnail_url'],
                          description: filteredMessages[index]['description'],
                          url: filteredMessages[index]['video_id'],
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

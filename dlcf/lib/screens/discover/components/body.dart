import 'dart:convert';

import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/api/models.dart';
import 'package:dlcf/screens/discover/components/suggestion_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DiscoverBody extends StatefulWidget {
  const DiscoverBody({Key? key}) : super(key: key);

  @override
  State<DiscoverBody> createState() => _DiscoverBodyState();
}

class _DiscoverBodyState extends State<DiscoverBody> {
  bool _isSearching = false;
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
      _isSearching = true;
      isLoading = true;
    });

    var response = await http.get(Uri.parse(EndPoints.youtubevideos));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        messages = data['videos'];
        isLoading = false;
      });
      _filterMessages(); // Filter messages initially
    } else {
      print('API request failed with status code: ${response.statusCode}');
      setState(() {
        isLoading = false;
      });
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
                        return SuggestionBox(
                          title: filteredMessages[index]['title'],
                          preacher: filteredMessages[index]['preacher'] ??
                              'Pastor Dr. W. F. Kumuyi',
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

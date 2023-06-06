// ignore_for_file: avoid_print

import 'package:dlcf/api/endpoints.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:dlcf/screens/home/components/channel_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChannelBody extends StatefulWidget {
  const ChannelBody({super.key});

  @override
  State<ChannelBody> createState() => _ChannelBodyState();
}

class _ChannelBodyState extends State<ChannelBody> {
  bool isLoading = false;
  List<dynamic> channels = [];

  @override
  void initState() {
    super.initState();
    fetchChannels();
  }

  fetchChannels() async {
    // loading data
    setState(() {
      isLoading = true;
    });
    // hitting endpoint
    var response = await http.get(Uri.parse(EndPoints.channels));
    // checking status code
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        channels = data['categories'];
        isLoading = false;
      });
    } else {
      print("ERROR FETCHING CHANNELS: CODE: ${response.statusCode}");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.blue,
            ))
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: channels.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(RouteNames.channelmessages, params: {
                          'channelName': channels[index]['name'],
                          'channelID': channels[index]['name'].toString(),
                        });
                      },
                      child: ChannelBox(
                        name: channels[index]['name'],
                        thumbnail:
                            EndPoints.BASE + channels[index]['thumbnail'],
                        id: channels[index]['id'],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

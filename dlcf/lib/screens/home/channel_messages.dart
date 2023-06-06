import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:dlcf/screens/home/components/channelsMessagesBody.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChannelMessages extends StatelessWidget {
  final String channelName;
  final String channelID;
  const ChannelMessages({
    super.key,
    required this.channelName,
    required this.channelID,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            channelName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).pushNamed(RouteNames.home);
            },
          ),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: ChannelMessagesBody(
          channelID: channelID,
          channelName: channelName,
        ),
        bottomNavigationBar: CustomBottomNav(selectedTab: 1),
      ),
    );
  }
}

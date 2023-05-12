import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/screens/home/components/channels_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChannelMessages extends StatelessWidget {
  final String channelName;
  final String description;
  const ChannelMessages({
    super.key,
    required this.channelName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            elevation: 0,
            backgroundColor: Colors.blue,
            title: Text(
              channelName.toUpperCase(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          body: const ChannelBody(),
          bottomNavigationBar: CustomBottomNav(selectedTab: 0),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          )),
    );
  }
}

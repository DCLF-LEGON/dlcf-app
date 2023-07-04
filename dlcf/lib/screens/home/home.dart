import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/screens/home/components/channels_body.dart';
import 'package:dlcf/screens/home/components/gallery_category.dart';
import 'package:dlcf/screens/home/components/live_stream.dart';
import 'package:dlcf/screens/home/components/sermon_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'DLCF LEGON APP',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: const TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.blue,
              indicatorColor: Colors.blue,
              isScrollable: true,
              tabs: [
                Tab(text: 'SERMONS'),
                Tab(text: 'CHANNELS'),
                Tab(text: 'GALLERY'),
                Tab(text: 'LIVE'),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: const TabBarView(
            children: [
              SermonBody(),
              ChannelBody(),
              GalleryCategoryBody(),
              LiveStreamBody(),
            ],
          ),
          bottomNavigationBar: CustomBottomNav(selectedTab: 0),
        ),
      ),
    );
  }
}

// ignore_for_file: avoid_print

import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dlcf/api/endpoints.dart';
import 'package:photo_view/photo_view.dart';

class LeadersScreen extends StatefulWidget {
  const LeadersScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LeadersScreenState createState() => _LeadersScreenState();
}

class _LeadersScreenState extends State<LeadersScreen> {
  List<dynamic> leaders = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchLeaders();
  }

  fetchLeaders() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(Uri.parse(EndPoints.leaders));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        leaders = data['leaders'];
        isLoading = false;
      });
    } else {
      print("ERROR OCCURED: CODE: ${response.statusCode}");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Leaders'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : leaders.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Meet our industrous leaders',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: AnimationLimiter(
                        child: ListView.builder(
                          itemCount: leaders.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Card(
                                      // color: Colors.blue,
                                      elevation: 0,
                                      child: _buildLeader(
                                          context,
                                          leaders[index]['name'],
                                          leaders[index]['title'],
                                          leaders[index]['position'],
                                          leaders[index]['picture'])),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.person_off_outlined,
                        size: 72,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No Leaders',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
      bottomNavigationBar: CustomBottomNav(selectedTab: 4),
    );
  }

  Widget _buildLeader(
    BuildContext context,
    String name,
    String title,
    String position,
    String picture,
  ) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: PhotoView(
                imageProvider: NetworkImage(EndPoints.BASE + picture),
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2.0,
                heroAttributes:
                    PhotoViewHeroAttributes(tag: EndPoints.BASE + picture),
              ),
            );
          },
        );
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(EndPoints.BASE + picture),
                radius: 30,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$name ($title)",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      position,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

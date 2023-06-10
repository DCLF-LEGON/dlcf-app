import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dlcf/api/endpoints.dart';

class GalleryCategoryScreen extends StatefulWidget {
  const GalleryCategoryScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GalleryCategoryScreenState createState() => _GalleryCategoryScreenState();
}

class _GalleryCategoryScreenState extends State<GalleryCategoryScreen> {
  List<dynamic> doctrines = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchGalleryCategories();
  }

  fetchGalleryCategories() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(Uri.parse(EndPoints.galleryCategory));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        doctrines = data['categories'];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Categories'),
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
          : doctrines.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Explore the beautiful gallery of our campus fellowship.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: AnimationLimiter(
                        child: ListView.builder(
                          itemCount: doctrines.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: InkWell(
                                    onTap: () {
                                      GoRouter.of(context).pushNamed(
                                        RouteNames.doctrinedetail,
                                        params: {
                                          'id': "${index + 1}".toString(),
                                          'title': doctrines[index]['title'],
                                        },
                                      );
                                    },
                                    child: Card(
                                      color: Colors.blue,
                                      elevation: 0,
                                      child: ListTile(
                                        textColor: Colors.white,
                                        title: Text(
                                          "#${index + 1}. ${doctrines[index]['title']}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          '${doctrines[index]['description'].toString().substring(23, 71)}...',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        Icons.notifications_off,
                        size: 72,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No Doctrines',
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
}

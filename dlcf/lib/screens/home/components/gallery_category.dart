import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dlcf/api/endpoints.dart';

class GalleryCategoryBody extends StatefulWidget {
  const GalleryCategoryBody({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GalleryCategoryBodyState createState() => _GalleryCategoryBodyState();
}

class _GalleryCategoryBodyState extends State<GalleryCategoryBody> {
  List<dynamic> categories = [];
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
        categories = data['categories'];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : categories.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Explore the beautiful gallery of our campus fellowship.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(
                      child: AnimationLimiter(
                        child: ListView.builder(
                          itemCount: categories.length,
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
                                        RouteNames.gallerycategoryimages,
                                        params: {
                                          'id': categories[index]['id']
                                              .toString(),
                                          'name': categories[index]['name'],
                                        },
                                      );
                                    },
                                    child: Card(
                                      color: Colors.blue,
                                      elevation: 0,
                                      child: ListTile(
                                        textColor: Colors.white,
                                        leading: Image(
                                          image: NetworkImage(EndPoints.BASE +
                                              categories[index]['thumbnail']),
                                          height: 50,
                                          width: 50,
                                        ),
                                        title: Text(
                                          "${categories[index]['name']}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: const Text(
                                          "Click to view gallery",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54),
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
                        'No Categories',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

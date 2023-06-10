import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dlcf/api/endpoints.dart';

class ChurchDocumentScreen extends StatefulWidget {
  const ChurchDocumentScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChurchDocumentScreenState createState() => _ChurchDocumentScreenState();
}

class _ChurchDocumentScreenState extends State<ChurchDocumentScreen> {
  List<dynamic> documents = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchChurchDocuments();
  }

  fetchChurchDocuments() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(Uri.parse(EndPoints.churchDocuments));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        documents = data['documents'];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Church Documents'),
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
          : documents.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Stir up your Spirit with these spiritual documents.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: AnimationLimiter(
                        child: ListView.builder(
                          itemCount: documents.length,
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
                                          'id':
                                              documents[index]['id'].toString(),
                                          'title': documents[index]['title'],
                                          'document': documents[index]
                                              ['document'],
                                        },
                                      );
                                    },
                                    child: Card(
                                      color: Colors.blue,
                                      elevation: 0,
                                      child: ListTile(
                                        textColor: Colors.white,
                                        title: Text(
                                          "${documents[index]['title']}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: const Text(
                                          'Click to read document',
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
                        'No Documents',
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

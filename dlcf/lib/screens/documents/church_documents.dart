// ignore_for_file: avoid_print

import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dlcf/api/endpoints.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

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
                        'Stir up Your Spirit with these Spiritual Documents.',
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
                                        RouteNames.readdocument,
                                        params: {
                                          'id':
                                              documents[index]['id'].toString(),
                                          'title': documents[index]['title'],
                                          'document': EndPoints.BASE +
                                              documents[index]['document'],
                                        },
                                      );
                                    },
                                    child: Card(
                                      color: Colors.blue,
                                      elevation: 0,
                                      child: ListTile(
                                        textColor: Colors.white,
                                        leading: const Icon(
                                          Icons.menu_book_outlined,
                                          size: 36,
                                        ),
                                        title: Text(
                                          "${documents[index]['title']}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: const Text(
                                          'Click To Read Document',
                                        ),
                                        trailing: InkWell(
                                          child: const Icon(
                                            Icons.cloud_download,
                                            size: 36,
                                          ),
                                          onTap: () {
                                            FileDownloader.downloadFile(
                                                url: EndPoints.BASE +
                                                    documents[index]
                                                        ['document'],
                                                name: documents[index]['title'],
                                                onProgress:
                                                    (fileName, progress) {
                                                  print(
                                                      'FILE $fileName HAS PROGRESS $progress');
                                                },
                                                onDownloadCompleted:
                                                    (String path) {
                                                  print(
                                                      'FILE DOWNLOADED TO PATH: $path');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Downloaded to $path'),
                                                    ),
                                                  );
                                                },
                                                onDownloadError:
                                                    (String error) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Error Downloading File!'),
                                                    ),
                                                  );
                                                });
                                          },
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
              : const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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

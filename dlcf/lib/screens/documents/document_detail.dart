// ignore_for_file: avoid_print

import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class DocumentDetailScreen extends StatefulWidget {
  final String id;
  final String title;
  final String document;
  const DocumentDetailScreen({
    Key? key,
    required this.id,
    required this.title,
    required this.document,
  }) : super(key: key);

  @override
  State<DocumentDetailScreen> createState() => _DocumentDetailScreenState();
}

class _DocumentDetailScreenState extends State<DocumentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SfPdfViewer.network(widget.document),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("URL: ${widget.document}");
          print("NAME: ${widget.title}");
          FileDownloader.downloadFile(
              url: widget.document,
              name: widget.title,
              onProgress: (fileName, progress) {
                print('FILE $fileName HAS PROGRESS $progress');
              },
              onDownloadCompleted: (String path) {
                print('FILE DOWNLOADED TO PATH: $path');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Downloaded to $path'),
                  ),
                );
              },
              onDownloadError: (String error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error Downloading File!'),
                  ),
                );
              });
        },
        child: const Icon(Icons.cloud_download_outlined),
      ),
      bottomNavigationBar: CustomBottomNav(selectedTab: 4),
    );
  }
}

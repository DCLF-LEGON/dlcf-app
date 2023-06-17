import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: unused_import
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DocumentDetailScreen extends StatelessWidget {
  final int id;
  final String title;
  final String document;
  const DocumentDetailScreen({
    Key? key,
    required this.id,
    required this.title,
    required this.document,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "God's word teaches:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                document,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(selectedTab: 4),
    );
  }
}

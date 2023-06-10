// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dlcf/api/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';

class GalleryCategoryImagesScreen extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  const GalleryCategoryImagesScreen(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GalleryCategoryImagesScreenState createState() =>
      _GalleryCategoryImagesScreenState();
}

class _GalleryCategoryImagesScreenState
    extends State<GalleryCategoryImagesScreen> {
  List<dynamic> images = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchGalleryCategoryImages();
  }

  fetchGalleryCategoryImages() async {
    setState(() {
      isLoading = true;
    });
    print(widget.categoryId);
    print(widget.categoryName);
    var response = await http.get(Uri.parse(
        '${EndPoints.galleryCategoryImages}?category_id=${widget.categoryId}'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        images = data['images'];
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
        title: Text("${widget.categoryName} Gallery"),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: images.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.count(
                crossAxisCount: 2,
                children: List.generate(images.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      _showImagePopup(
                          context, EndPoints.BASE + images[index]['image']);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              EndPoints.BASE + images[index]['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
              ),
      ),
    );
  }

  void _showImagePopup(BuildContext context, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: PhotoView(
            imageProvider: NetworkImage(image),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2.0,
            heroAttributes: PhotoViewHeroAttributes(tag: image),
          ),
        );
      },
    );
  }
}

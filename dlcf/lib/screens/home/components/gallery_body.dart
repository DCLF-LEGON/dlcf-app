import 'dart:convert';
import 'package:dlcf/api/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';

class GalleryBody extends StatefulWidget {
  const GalleryBody({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GalleryBodyState createState() => _GalleryBodyState();
}

class _GalleryBodyState extends State<GalleryBody> {
  List<dynamic> images = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  fetchImages() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(Uri.parse(EndPoints.gallery));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        images = data['images'];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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

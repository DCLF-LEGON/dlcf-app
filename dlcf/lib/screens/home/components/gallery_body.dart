import 'package:dlcf/assets.dart';
import 'package:flutter/material.dart';

class GalleryBody extends StatefulWidget {
  const GalleryBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GalleryBodyState createState() => _GalleryBodyState();
}

class _GalleryBodyState extends State<GalleryBody> {
  // fetch images from assets
  final List<String> images = [
    Assets.assetsThumbnailsKoinonia,
    Assets.assetsThumbnailsBibleStudy,
    Assets.assetsThumbnailsCampus,
    Assets.assetsThumbnailsChoir,
    Assets.assetsThumbnailsCongress,
    Assets.assetsThumbnailsFirehour,
    Assets.assetsThumbnailsKoinonia,
    Assets.assetsThumbnailsKoinonia,
    Assets.assetsThumbnailsBibleStudy,
    Assets.assetsThumbnailsCampus,
    Assets.assetsThumbnailsChoir,
    Assets.assetsThumbnailsCongress,
    Assets.assetsThumbnailsFirehour,
    Assets.assetsThumbnailsKoinonia,
  ];
  // final images = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(images.length, (index) {
          return GestureDetector(
            onTap: () {
              _showImagePopup(context, images[index]);
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // popup image using it's proper aspect ratio
  void _showImagePopup(BuildContext context, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: AspectRatio(
            aspectRatio: 16 /
                9, // calculate the aspect ratio dynamically based on the image size
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}










// import 'dart:convert';
// import 'package:dlcf/api/endpoints.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class GalleryBody extends StatefulWidget {
//   const GalleryBody({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _GalleryBodyState createState() => _GalleryBodyState();
// }

// class _GalleryBodyState extends State<GalleryBody> {
//   List<String> images = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchImages();
//   }

//   Future<void> fetchImages() async {
//     try {
//       final response = await http.get(Uri.parse(EndPoints.gallery));

//       if (response.statusCode == 200) {
//         final List<String> fetchedImages =
//             parseImagesFromResponse(response.body);

//         setState(() {
//           images = fetchedImages;
//         });
//       } else {
//         print('API request failed with status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching images: $e');
//     }
//   }

//   List<String> parseImagesFromResponse(String responseBody) {
//     final List<String> imageUrls = [];

//     try {
//       final Map<String, dynamic> data = jsonDecode(responseBody);
//       final List<dynamic> images = data['images'];

//       for (final image in images) {
//         final String imageUrl = image['image'];
//         imageUrls.add(imageUrl);
//       }
//     } catch (e) {
//       print('Error parsing images from API response: $e');
//     }

//     return imageUrls;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: GridView.count(
//         crossAxisCount: 2,
//         children: List.generate(images.length, (index) {
//           return GestureDetector(
//             onTap: () {
//               _showImagePopup(context, images[index]);
//             },
//             child: Container(
//               margin: const EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 image: DecorationImage(
//                   image: NetworkImage(EndPoints.BASE + images[index]),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }

//   void _showImagePopup(BuildContext context, String image) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           child: AspectRatio(
//             aspectRatio: 16 / 9,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 image: DecorationImage(
//                   image: NetworkImage(image),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:dlcf/assets.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuggestionBox extends StatelessWidget {
  final String title;
  final String preacher;
  final String thumbnailUrl;
  final String description;
  final String url;

  const SuggestionBox({
    super.key,
    required this.title,
    required this.preacher,
    required this.thumbnailUrl,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(
          RouteNames.video,
          params: {
            'url': url,
            'title': title,
            'thumbnailUrl': thumbnailUrl,
            'preacher': preacher,
            'description': description,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(Assets.assetsThumbnailsBibleStudy),
                  fit: BoxFit.cover,
                ),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(preacher),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

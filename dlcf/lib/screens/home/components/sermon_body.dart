import 'package:dlcf/api/models.dart';
import 'package:dlcf/assets.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:dlcf/screens/home/components/recently_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SermonBody extends StatelessWidget {
  const SermonBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Message> recently = [
      Message(
        id: 1,
        description: 'Message 1',
        title: 'Title 1',
        url: 'C2a6ZxOwEH8',
        preacher: 'Pastor Preacher 1',
        thumbnailUrl: Assets.assetsThumbnailsNc,
      ),
      Message(
        id: 2,
        description: 'Message 2',
        title: 'Title 2',
        url: '4fNMM35VJD0',
        preacher: 'Pastor Preacher 2',
        thumbnailUrl: Assets.assetsThumbnailsGs,
      ),
      Message(
        id: 3,
        description: 'Message 3',
        title: 'Title 3',
        url: 'E50a9SFVL64',
        preacher: 'Pastor Preacher 3',
        thumbnailUrl: Assets.assetsThumbnailsGs,
      ),
      Message(
        id: 4,
        description: 'Message 4',
        title: 'Title 4',
        url: 'd-eTfjcj6X4',
        preacher: 'Pastor Preacher 4',
        thumbnailUrl: Assets.assetsThumbnailsGs,
      ),
      Message(
        id: 5,
        description: 'Message 5',
        title: 'Title 5',
        url: 'd-eTfjcj6X4',
        preacher: 'Pastor Preacher 5',
        thumbnailUrl: Assets.assetsThumbnailsGs,
      ),
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                  filled: false,
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                // mainAxisAlignment: ,
                children: <Widget>[
                  Text(
                    'Welcome to the',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'DLCF-LEGON APP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(Assets.assetsThumbnailsBibleStudy),
                          fit: BoxFit.cover),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: const Text('New')),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            const Text(
                              'MONDAY',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              onPressed: () {
                                GoRouter.of(context).pushNamed(
                                  RouteNames.video,
                                  params: {
                                    'url': 'rZQr2Qn6J38',
                                    'title': 'The God who never fails',
                                    'thumbnailUrl':
                                        Assets.assetsThumbnailsBibleStudy,
                                    'preacher': 'Ps. Dr. W. F. Kumuyi',
                                    'description':
                                        'He is te God that never fails',
                                  },
                                );
                              },
                              splashColor: Colors.blue,
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 34,
                              ),
                            )
                          ],
                        ),
                        const Text(
                          'BIBLE STUDY',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'RECENTLY WATCHED SERMONS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    recently.length,
                    (index) => InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                          RouteNames.video,
                          params: {
                            'url': recently[index].url,
                            'title': recently[index].title,
                            'thumbnailUrl': recently[index].thumbnailUrl,
                            'preacher': recently[index].preacher,
                            'description': recently[index].description,
                          },
                        );
                      },
                      child: RecentlyBox(
                        title: recently[index].title,
                        preacher: recently[index].preacher,
                        url: recently[index].url,
                        description: recently[index].description,
                        thumbnailUrl: recently[index].thumbnailUrl,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'POPULAR SERMONS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    recently.length,
                    (index) => InkWell(
                      child: RecentlyBox(
                        title: recently[index].title,
                        preacher: recently[index].preacher,
                        url: recently[index].url,
                        description: recently[index].description,
                        thumbnailUrl: recently[index].thumbnailUrl,
                      ),
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                          RouteNames.video,
                          params: {
                            'url': recently[index].url,
                            'title': recently[index].title,
                            'thumbnailUrl': recently[index].thumbnailUrl,
                            'preacher': recently[index].preacher,
                            'description': recently[index].description,
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

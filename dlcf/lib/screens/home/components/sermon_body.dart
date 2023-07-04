import 'package:dlcf/api/models.dart';
import 'package:dlcf/assets.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:dlcf/screens/home/components/gods_generals_container.dart';
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
        description: "The Breastplate of Righteousness | Pastor Francis Fosu",
        title: "The Breastplate of Righteousness | Pastor Francis Fosu",
        url: 'wrN2TyS6wvc',
        preacher: 'Pastor Francis Fosu',
        thumbnailUrl: "https://i.ytimg.com/vi/wrN2TyS6wvc/hqdefault.jpg",
      ),
      Message(
        id: 2,
        description:
            "The Danger of Distraction | Pastor (Prof.) Charles Amoatey.",
        title: "The Danger of Distraction | Pastor (Prof.) Charles Amoatey",
        url: 'ySUGJdKJH9g',
        preacher: 'Pastor (Prof.) Charles Amoatey',
        thumbnailUrl: "https://i.ytimg.com/vi/ySUGJdKJH9g/hqdefault.jpg",
      ),
      Message(
        id: 3,
        description:
            "So Great Salvation | Pastor Prof. Charles Amoatey | Fortification 2023",
        title:
            "So Great Salvation | Pastor Prof. Charles Amoatey | Fortification 2023",
        url: 'SUA_LNP0HKg',
        preacher: 'Pastor (Prof.) Charles Amoatey',
        thumbnailUrl: "https://i.ytimg.com/vi/SUA_LNP0HKg/hqdefault.jpg",
      ),
      Message(
        id: 4,
        description:
            "One on One with Pastor Charles Owusu and Mama Victoria Owusu | Time with Gods generals",
        title:
            "Pastor Charles Owusu and Mama Victoria Owusu | Time with Gods generals",
        url: 'Wq19L_n4qP8',
        preacher: 'Pastor Charles Owusu and Mama Victoria Owusu',
        thumbnailUrl: "https://i.ytimg.com/vi/Wq19L_n4qP8/hqdefault.jpg",
      ),
      Message(
        id: 5,
        description:
            "Learn how to be fortified by the Holy Ghost | Fortification by the Holy Ghost | Pastor Edward Tumsiah",
        title: "Fortification by the Holy Ghost | Pastor Edward Tumsiah",
        url: 'eE_CsoxuSnI',
        preacher: 'Pastor Edward Tumsiah',
        thumbnailUrl: "https://i.ytimg.com/vi/eE_CsoxuSnI/hqdefault.jpg",
      ),
    ];

    // ignore: non_constant_identifier_names
    List<GodsGeneralsContainer> gods_generals = [
      const GodsGeneralsContainer(
        description:
            "Pastor Christopher A and Mama Lawrencia Ho regional overseer and wife Time with God's generals.",
        title:
            "Pastor Christopher A  and Mama Lawrencia Ho regional overseer and wife | Time with God's generals",
        url: '7KpbJ6xU8u4',
        preacher: 'Pastor Christopher A. and Mama Lawrencia',
        thumbnailUrl: "https://i.ytimg.com/vi/7KpbJ6xU8u4/hqdefault.jpg",
      ),
      const GodsGeneralsContainer(
        description:
            "Spend Some One on One time with Pastor Michel Kutin Assadu and Mama Agnes Kutin Assadu | Time with God's Generals",
        title:
            "Pastor Michel Kutin Assadu and Mama Agnes Kutin Assadu | Time with God's Generals",
        url: '_pW66FUf5dY',
        preacher: 'Pastor Michel Kutin Assadu and Mama Agnes Kutin Assadu',
        thumbnailUrl: "https://i.ytimg.com/vi/_pW66FUf5dY/hqdefault.jpg",
      ),
      const GodsGeneralsContainer(
        description:
            "One on One With Prof Joseph Sarkodie Addo and Wife | Time with God's Generals",
        title:
            "One on One With Prof Joseph Sarkodie Addo and Wife | Time with God's Generals",
        url: 'CjLXUjUHdlQ',
        preacher: 'Prof. Joseph Sarkodie Addo and Wife',
        thumbnailUrl: "https://i.ytimg.com/vi/CjLXUjUHdlQ/hqdefault.jpg",
      ),
      const GodsGeneralsContainer(
        description:
            "The is how to find the love of Your life | Pastor Tumsia Joint Koinonia",
        title: "How to find the love of Your life Pastor Tumsia",
        url: 'ERIv5APvOmo',
        preacher: 'Pastor Tumsia',
        thumbnailUrl: "https://i.ytimg.com/vi/ERIv5APvOmo/hqdefault.jpg",
      ),
      const GodsGeneralsContainer(
        description:
            "One on One With The Kumasi South Regional Overseer | Pastor Yaw Osei Owusu | Time with the generals.",
        title:
            "One on One With The Kumasi South Regional Overseer | Time with the generals",
        url: 'mQq05oTCL4A',
        preacher: 'Pastor Yaw Osei Owusu',
        thumbnailUrl: "https://i.ytimg.com/vi/mQq05oTCL4A/hqdefault.jpg",
      ),
    ];

    // ignore: non_constant_identifier_names
    List<GodsGeneralsContainer> popular_semons = [
      const GodsGeneralsContainer(
        description: "Shuttered Dreams | DLCF LEGON CHOIR",
        title: "Shuttered Dreams | DLCF LEGON CHOIR",
        url: 'iLl5Kdu0e5A',
        preacher: 'DLCF LEGON CHOIR',
        thumbnailUrl: "https://i.ytimg.com/vi/iLl5Kdu0e5A/hqdefault.jpg",
      ),
      const GodsGeneralsContainer(
        description:
            "The is how to find the love of Your life | Pastor Tumsia Joint Koinonia",
        title: "How to find the love of Your life Pastor Tumsia",
        url: 'ERIv5APvOmo',
        preacher: 'Pastor Tumsia',
        thumbnailUrl: "https://i.ytimg.com/vi/ERIv5APvOmo/hqdefault.jpg",
      ),
      const GodsGeneralsContainer(
        description:
            "One on One With The Kumasi South Regional Overseer | Pastor Yaw Osei Owusu | Time with the generals.",
        title:
            "One on One With The Kumasi South Regional Overseer | Time with the generals",
        url: 'mQq05oTCL4A',
        preacher: 'Pastor Yaw Osei Owusu',
        thumbnailUrl: "https://i.ytimg.com/vi/mQq05oTCL4A/hqdefault.jpg",
      ),
      const GodsGeneralsContainer(
        description:
            "Revelational Bible Study with Pastor W.F. Kumuyi The entrance of thy words giveth light; It giveth understanding unto the simple (2 ...",
        title:
            "Justification by Faith in Christ the Only Saviour  Bible Study Service  June 12, 2023",
        url: 'dU8Mq0KOSVE',
        preacher: 'Pastor Dr. W.F. Kumuyi',
        thumbnailUrl: "https://i.ytimg.com/vi/dU8Mq0KOSVE/hqdefault.jpg",
      ),
      const GodsGeneralsContainer(
        description:
            "Equipping and training class with W.F. Kumuyi Rooted and built up in him, and stablished in the faith, as ye have been taught, ...",
        title:
            "Christ's Perpetual Commandment On Loving Your Enemies  Workers Training  Pastor W.F. Kumuyi",
        url: 'rZQr2Qn6J38',
        preacher: 'Pastor Dr. W.F. Kumuyi',
        thumbnailUrl: "https://i.ytimg.com/vi/rZQr2Qn6J38/hqdefault.jpg",
      ),
      const GodsGeneralsContainer(
        description:
            "The is how to find the love of Your life | Pastor Tumsia Joint Koinonia",
        title: "How to find the love of Your life Pastor Tumsia",
        url: 'ERIv5APvOmo',
        preacher: 'Pastor Tumsia',
        thumbnailUrl: "https://i.ytimg.com/vi/ERIv5APvOmo/hqdefault.jpg",
      ),
      const GodsGeneralsContainer(
        description:
            "One on One With The Kumasi South Regional Overseer | Pastor Yaw Osei Owusu | Time with the generals.",
        title:
            "One on One With The Kumasi South Regional Overseer | Time with the generals",
        url: 'mQq05oTCL4A',
        preacher: 'Pastor Yaw Osei Owusu',
        thumbnailUrl: "https://i.ytimg.com/vi/mQq05oTCL4A/hqdefault.jpg",
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
              InkWell(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    RouteNames.video,
                    params: {
                      'url': 'rZQr2Qn6J38',
                      'title':
                          "Christ's Perpetual Commandment On Loving Your Enemies  Workers Training  Pastor W.F Kumuyi",
                      'thumbnailUrl': Assets.assetsThumbnailsBibleStudy,
                      'preacher': 'Ps. Dr. W. F. Kumuyi',
                      'description':
                          "Equipping and training class with W.F. Kumuyi Rooted and built up in him, and stablished in the faith, as ye have been taught, ...",
                    },
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image:
                                AssetImage(Assets.assetsThumbnailsBibleStudy),
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
                            child: const Text('New'),
                          ),
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
                                      'title':
                                          "Christ's Perpetual Commandment On Loving Your Enemies  Workers Training  Pastor W.F Kumuyi",
                                      'thumbnailUrl':
                                          Assets.assetsThumbnailsBibleStudy,
                                      'preacher': 'Ps. Dr. W. F. Kumuyi',
                                      'description':
                                          "Equipping and training class with W.F. Kumuyi Rooted and built up in him, and stablished in the faith, as ye have been taught, ...",
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
              ),
              const SizedBox(height: 20),
              const Text(
                'RECENTLY ADDED SERMONS',
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
                    popular_semons.length,
                    (index) => InkWell(
                      child: GodsGeneralsContainer(
                        title: popular_semons[index].title,
                        preacher: popular_semons[index].preacher,
                        url: popular_semons[index].url,
                        description: popular_semons[index].description,
                        thumbnailUrl: popular_semons[index].thumbnailUrl,
                      ),
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                          RouteNames.video,
                          params: {
                            'url': popular_semons[index].url,
                            'title': popular_semons[index].title,
                            'thumbnailUrl': popular_semons[index].thumbnailUrl,
                            'preacher': popular_semons[index].preacher,
                            'description': popular_semons[index].description,
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "TIME WITH GOD'S GENERALS",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    gods_generals.length,
                    (index) => InkWell(
                      child: GodsGeneralsContainer(
                        title: gods_generals[index].title,
                        preacher: gods_generals[index].preacher,
                        url: gods_generals[index].url,
                        description: gods_generals[index].description,
                        thumbnailUrl: gods_generals[index].thumbnailUrl,
                      ),
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                          RouteNames.video,
                          params: {
                            'url': gods_generals[index].url,
                            'title': gods_generals[index].title,
                            'thumbnailUrl': gods_generals[index].thumbnailUrl,
                            'preacher': gods_generals[index].preacher,
                            'description': gods_generals[index].description,
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

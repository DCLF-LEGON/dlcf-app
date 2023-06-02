import 'package:dlcf/api/models.dart';
import 'package:dlcf/assets.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:dlcf/screens/home/components/channel_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChannelBody extends StatelessWidget {
  const ChannelBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Channel> channels = [
      Channel(
        id: 1,
        name: 'Bible Study',
        description: 'Monday Bible Study',
        thumbnailUrl: Assets.assetsThumbnailsBibleStudy,
      ),
      Channel(
        id: 2,
        name: 'Campus Service',
        description: 'Hall based koinonia service',
        thumbnailUrl: Assets.assetsThumbnailsCampus,
      ),
      Channel(
        id: 3,
        name: 'Koinonia',
        description: 'Hall based koinonia service',
        thumbnailUrl: Assets.assetsThumbnailsKoinonia,
      ),
      Channel(
        id: 4,
        name: 'Choir',
        description: 'Choir orchestra',
        thumbnailUrl: Assets.assetsThumbnailsChoir,
      ),
      Channel(
        id: 5,
        name: 'Fire Hour',
        description: 'Choir orchestra',
        thumbnailUrl: Assets.assetsThumbnailsFirehour,
      ),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: channels.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  GoRouter.of(context)
                      .pushNamed(RouteNames.channelmessages, params: {
                    'channelName': channels[index].name,
                    'channelID': channels[index].id.toString(),
                  });
                },
                child: ChannelBox(
                  name: channels[index].name,
                  thumbnail: channels[index].thumbnailUrl,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

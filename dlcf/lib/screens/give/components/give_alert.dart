import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:dlcf/assets.dart';
import 'package:go_router/go_router.dart';

class GiveAlertBody extends StatelessWidget {
  const GiveAlertBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select preferred network'),
      content: Container(
        height: 250,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            InkWell(
              child: Image.asset(Assets.assetsNetworksMtn1, height: 70),
              onTap: () {
                GoRouter.of(context).pushNamed(
                  RouteNames.givemomo,
                  params: {
                    'network': Networks.mtn,
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            InkWell(
              child: Image.asset(Assets.assetsNetworksVodafone, height: 70),
              onTap: () {
                GoRouter.of(context).pushNamed(
                  RouteNames.givemomo,
                  params: {
                    'network': Networks.voda,
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            InkWell(
              child: Image.asset(Assets.assetsNetworksAirteltigo, height: 50),
              onTap: () {
                GoRouter.of(context).pushNamed(
                  RouteNames.givemomo,
                  params: {
                    'network': Networks.airteltigo,
                  },
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

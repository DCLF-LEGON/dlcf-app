import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/screens/give/components/momo_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GiveMomoScreen extends StatelessWidget {
  final String network;
  const GiveMomoScreen({super.key, required this.network});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          title: const Text('MOMO'),
          centerTitle: true,
          elevation: 0,
        ),
        body: GiveMomoBody(network: network),
        bottomNavigationBar: CustomBottomNav(selectedTab: 4),
      ),
    );
  }
}

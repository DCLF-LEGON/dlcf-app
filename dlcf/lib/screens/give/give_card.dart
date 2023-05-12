import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/screens/give/components/body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GiveScreen extends StatelessWidget {
  const GiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // leading: const Icon(Icons.arrow_back_ios),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          title: const Text('GIVE'),
          centerTitle: true,
          elevation: 0,
        ),
        body: const GiveBody(),
        bottomNavigationBar: CustomBottomNav(selectedTab: 4),
      ),
    );
  }
}

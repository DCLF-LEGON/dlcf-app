import 'package:dlcf/assets.dart';
import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('About Us'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Image.asset(Assets.assetsLogosDlcfLogo, height: 100),
              const SizedBox(height: 20),
              const Text(
                'Welcome to DLCF Legon',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'About Us',
                style: TextStyle(
                  // fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'On the University of Ghana, campus, the Fellowship is affiliated to the Deeper Christian Life Ministry, a non-sectarian, inter-denominational and international body of earnest Bible believing Christians (headquarters Based in Lagos, Nigeria) dedicated to the preaching of the gospel of Christ by word and deed and committed to the task of total fulfillment of the Great Commission (Matthew 28: 19,20), in this generation.',
                style: TextStyle(
                  // fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Our Mission',
                style: TextStyle(
                  // fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Our mission is to lead students, national service persons, staffs and other members of the campus community to a personal encounter with Christ and to have deeper knowledge and Christian experience with our lord Jesus. (Mathew 28:19-20) Alaso, to train them to become God approved Christian leaders (2 Timothy 2:15).',
                style: TextStyle(
                  // fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Our Motto',
                style: TextStyle(
                  // fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Raising Saintly Intellectuals.',
                style: TextStyle(
                  // fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Our Overseers',
                style: TextStyle(
                  // fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: <Widget>[
                    _buildTeamMember(
                      context,
                      'Ps. Prof. Charlse Amoatey',
                      'Campus Pastor',
                      'Ps. Prof. Charlse Amoatey is our campus pastor. He is a very hardworking person and he is very passionate about his work.',
                      Assets.assetsPicturesMamapeace,
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    _buildTeamMember(
                      context,
                      'Dr. Peace Amoatey',
                      'Sister\'s Coordinator',
                      'Dr. Peace Amoatey is our sister\'s coordinator. She is a very hardworking person and she is very passionate about her work.',
                      Assets.assetsPicturesMamapeace,
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(selectedTab: 4),
    );
  }

  Widget _buildTeamMember(
    BuildContext context,
    String name,
    String title,
    String bio,
    String avatarUrl,
  ) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: AspectRatio(
                  aspectRatio:
                      1, // You can adjust this value based on the image aspect ratio
                  child: Image.asset(
                    avatarUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
          barrierDismissible: true,
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(avatarUrl),
            radius: 30,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(bio),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

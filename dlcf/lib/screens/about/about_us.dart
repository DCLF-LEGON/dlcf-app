import 'package:dlcf/assets.dart';
import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';

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
                      "Prof. Charles Amoatey has over 15 years of experience in Development Evaluation. He is currently the Director of the GIMPA Training and Consulting and Heads Development Impact West Africa Project at GIMPA. Charles holds a bachelor’s degree in Civil Engineering, a master degree in Infrastructure Planning with a specialization in Project Management, an MBA with a specialization in Finance and International Management and a Ph.D. in Development Economics. He has consulted for several local and international Development Agencies including the World Bank, ACBF, ECOWAS Commission, AUC, IFAD, UNDP, DFID, GIZ, KfW, SECO and Danida in the fields of Project Planning, Monitoring and Evaluation (M&E) and regional economic development. Charles has supported several public sector agencies and international agencies in policy development, training and setting up of Monitoring and Evaluation systems. He led the development of M&E policies for Ghana and ECOWAS and supported the Ghana M&E Ministry in the development of an ICT-based government-wide Results framework. He is Technical Advisor of the National M&E Information Systems been developed the National Development Planning Commission. Prof. Amoatey also led the preparation of a Joint UN Proposal for the Development of Northern Ghana. He is currently leading the impact evaluation of the One-Village-One-Dam initiative of the government in the five northern regions of Ghana, and also serves as the M&E consultant on the Ghana Skills and Jobs Project implemented by the Ministry of Employment and Labour Relations.",
                      Assets.assetsPicturesPastor,
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    _buildTeamMember(
                      context,
                      'Dr. Peace Amoatey',
                      'Sister\'s Coordinator',
                      "Dr Mrs Peace Amoatey is the Sisters' coordinator of the Deeper Life campus fellowship Legon. She has nurtured and impacted a lot of lives positively through her ministry. Her love, commitment for God and how she combines ministry with family and profession is overwhelming. She is married to Professor Pastor Charles Amoatey and they are blessed with three lovely children. She had her tertiary education in Civil engineering at the Kwame Nkrumah University of Science and Technology (KNUST). She holds a Master's degree in Resources Engineering(water&land) from the Karlsruhe Institute of Technology (KIT), Germany. She is also a doctoral degree(PHD) holder in Civil engineering from the University of Statgart, Germany. She is currently the a lecturer and the Head of Department at the Agricultural Engineering Department, University of Ghana.",
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
              child: PhotoView(
                imageProvider: AssetImage(avatarUrl),
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2.0,
                heroAttributes: PhotoViewHeroAttributes(tag: avatarUrl),
              ),
            );
          },
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

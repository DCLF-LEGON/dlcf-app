import 'package:dlcf/api/models.dart';
import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class DoctrineScreen extends StatefulWidget {
  const DoctrineScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DoctrineScreenState createState() => _DoctrineScreenState();
}

class _DoctrineScreenState extends State<DoctrineScreen> {
  final List<Doctrine> doctrines = [
    Doctrine(
      id: 1,
      title: "The Trinity",
      brief:
          "God exists in three persons: the Father, the Son, and the Holy Spirit.",
      body:
          "The doctrine of the Trinity is one of the most fundamental beliefs of Christianity. It teaches that there is only one God, but that this one God exists in three distinct persons: the Father, the Son (Jesus Christ), and the Holy Spirit. Each person of the Trinity is fully God, yet the three are distinct from one another. This doctrine is derived from various passages in the Bible, such as Matthew 28:19, which commands believers to baptize in the name of the Father, the Son, and the Holy Spirit.",
    ),
    Doctrine(
      id: 2,
      title: "Salvation by Grace Through Faith",
      brief: "Salvation is a gift of God that cannot be earned or deserved.",
      body:
          "The doctrine of salvation by grace through faith is another essential belief of Christianity. It teaches that salvation is a gift from God that cannot be earned or deserved by human effort. Rather, it is granted to those who place their faith in Jesus Christ and his sacrificial death on the cross. This doctrine is based on numerous passages in the Bible, such as Ephesians 2:8-9, which states that salvation is not of works, but is a gift of God.",
    ),
    Doctrine(
      id: 3,
      title: "The Authority of Scripture",
      brief: "The Bible is the inspired and authoritative Word of God.",
      body:
          "The doctrine of the authority of Scripture is the belief that the Bible is the inspired and authoritative Word of God. This means that the Bible is not merely a human book, but is the very Word of God, written by human authors under the guidance of the Holy Spirit. This doctrine is supported by various passages in the Bible, such as 2 Timothy 3:16-17, which states that all Scripture is God-breathed and useful for teaching, rebuking, correcting, and training in righteousness.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctrines'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // GoRouter.of(context).pushNamed(RouteNames.home);
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: doctrines.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Explore the foundational teachings of our faith on our Doctrine page.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: AnimationLimiter(
                    child: ListView.builder(
                      itemCount: doctrines.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: InkWell(
                                onTap: () {
                                  GoRouter.of(context).pushNamed(
                                    RouteNames.doctrinedetail,
                                    params: {
                                      'id': doctrines[index].id.toString(),
                                      'title': doctrines[index].title,
                                      'body': doctrines[index].body,
                                    },
                                  );
                                },
                                child: Card(
                                  color: Colors.blue,
                                  elevation: 0,
                                  child: ListTile(
                                    textColor: Colors.white,
                                    title: Text(
                                      "#${index + 1}. ${doctrines[index].title}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(doctrines[index].brief),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    Icons.notifications_off,
                    size: 72,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No Doctrines',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: CustomBottomNav(selectedTab: 4),
    );
  }
}

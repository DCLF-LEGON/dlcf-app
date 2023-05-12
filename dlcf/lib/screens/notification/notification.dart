import 'package:dlcf/general/components/bottom_nav.dart';
import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<String> notifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pushNamed(RouteNames.home);
          },
        ),
      ),
      body: notifications.isNotEmpty
          ? AnimationLimiter(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Slidable(
                          key: Key(notifications[index]),
                          actionPane: const SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: () {
                                setState(() {
                                  notifications.removeAt(index);
                                });
                              },
                            ),
                          ],
                          child: Card(
                            child: ListTile(
                              title: Text(notifications[index]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
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
                    'No Notifications',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: CustomBottomNav(selectedTab: 3),
    );
  }
}

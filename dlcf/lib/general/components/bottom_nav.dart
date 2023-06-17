import 'package:dlcf/general/routing/nav_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class CustomBottomNav extends StatefulWidget {
  late int selectedTab;
  CustomBottomNav({super.key, required this.selectedTab});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedTab,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.lightBlueAccent,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        switch (value) {
          case 0:
            GoRouter.of(context).pushReplacementNamed(RouteNames.home);
            break;
          case 1:
            GoRouter.of(context).pushReplacementNamed(RouteNames.discover);
            break;
          case 2:
            GoRouter.of(context).pushReplacementNamed(RouteNames.notes);
            break;
          case 3:
            GoRouter.of(context).pushReplacementNamed(RouteNames.notification);
            break;
          case 4:
            GoRouter.of(context).pushReplacementNamed(RouteNames.profile);
            break;
          default:
            GoRouter.of(context).pushReplacementNamed(RouteNames.home);
        }
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
            label: 'Sermon'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Discover'),
        BottomNavigationBarItem(
            icon: Icon(Icons.edit_location_alt), label: 'Notes'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Notice'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            activeIcon: Icon(Icons.person),
            label: 'Profile'),
      ],
    );
  }
}

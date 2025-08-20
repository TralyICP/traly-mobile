import 'package:flutter/material.dart';
import 'package:traly/src/features/bottom_navigation/pages/clean.dart';
import 'package:traly/src/features/bottom_navigation/pages/home_page.dart';
import 'package:traly/src/features/bottom_navigation/pages/leaderboard.dart';
import 'package:traly/src/features/bottom_navigation/pages/rewards.dart';
import 'package:traly/src/features/bottom_navigation/pages/settings.dart';


enum BottomNavigationPage {
  homePage,
  clean,
  rewards,
 leaderboard,
 settings,
}

class BottomNavigationScreen extends StatefulWidget {
  final BottomNavigationPage page;
  const BottomNavigationScreen({
    super.key,
    this.page = BottomNavigationPage.homePage,
  });

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return switch (widget.page) {
      BottomNavigationPage.homePage => const Home(),
      BottomNavigationPage.clean => const Clean(),
      BottomNavigationPage.rewards => const Rewards(),
      BottomNavigationPage.leaderboard => const LeaderBoard(),
      BottomNavigationPage.settings=> const Settings(),
    };
  }
}

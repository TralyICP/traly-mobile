import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traly/src/features/bottom_navigation/pages/clean.dart';
import 'package:traly/src/features/bottom_navigation/pages/home_page.dart';
import 'package:traly/src/features/bottom_navigation/pages/leaderboard.dart';
import 'package:traly/src/features/bottom_navigation/pages/rewards.dart';
import 'package:traly/src/features/bottom_navigation/pages/settings.dart';

class BottomNavController extends ChangeNotifier {
  final Ref ref;

  BottomNavController({
    required this.ref,
  });

  final dashBoardList = const [
    Home(),
    Clean(),
    Rewards(),
    LeaderBoard(),
    Settings(),
  ];

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

final bottomNavController =
    ChangeNotifierProvider.autoDispose<BottomNavController>((ref) {
  return BottomNavController(ref: ref);
});

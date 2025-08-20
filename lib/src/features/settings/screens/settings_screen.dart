import 'package:flutter/material.dart';
import 'package:traly/src/features/settings/pages/achievements.dart';

enum SettingsPage {
  yourBadges,
}


class SettingsScreen extends StatefulWidget {
  final SettingsPage page;
  const SettingsScreen({super.key, this.page = SettingsPage.yourBadges});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return switch (widget.page) {
    SettingsPage.yourBadges => const AchievementsPage(),

    };
  }
}
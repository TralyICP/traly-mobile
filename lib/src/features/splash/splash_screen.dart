import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/features/splash/application/splash_routing.dart';
import 'package:traly/src/routing/router_config.dart';
import 'package:traly/src/theme/color/color_scheme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3), () {
        log('SplashScreen: Initializing routing...');
        //  onRouteDestination(ProgramStart.firstLaunch.name);
        if (mounted) {
          context.goNamed(AppRoute.onboarding.name);
        }
      });
    });
  }

  Future<void> onRouteDestination(String value) async {
    RouteApp route = RouteApp(startType: value.launchState);

    if (mounted) return;
    route.execute(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColors.primary.shade500,
          AppColors.primary.shade900,
        ])),
        child: Center(child: Assets.images.tralyLogo.image()),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:traly/src/routing/router_config.dart';

abstract interface class Route {
  factory Route.init(ProgramStart programStart) {
    return switch (programStart) {
      ProgramStart.loggedOut => _LoggedOut(),
      ProgramStart.loggedIn => _LoggedIn(),
      ProgramStart.otaUpdate => _OTAUpdate(),
      ProgramStart.forceUpdate => _ForceUpdate(),
      _ => _FirstLaunch(),
    };
  }

  ProgramStart get startType;

  void execute(BuildContext context);
}

class _FirstLaunch implements Route {
  @override
  void execute(BuildContext context) {
    log('Executing first launch route');
    context.goNamed(AppRoute.onboarding.name);
  }

  @override
  ProgramStart get startType => ProgramStart.firstLaunch;
}

class _LoggedOut implements Route {
  @override
  void execute(BuildContext context) {
 //   context.goNamed(AppRoute.authScreen.name);
  }

  @override
  ProgramStart get startType => ProgramStart.loggedOut;
}

class _LoggedIn implements Route {
  @override
  void execute(BuildContext context) {
 //   context.goNamed(AppRoute.authScreen.name);
  }

  @override
  ProgramStart get startType => ProgramStart.loggedIn;
}

class _OTAUpdate implements Route {
  @override
  void execute(BuildContext context) {
  //  context.goNamed(AppRoute.otaUpdateScreen.name);
  }

  @override
  ProgramStart get startType => ProgramStart.otaUpdate;
}

class _ForceUpdate implements Route {
  @override
  void execute(BuildContext context) {
   // context.goNamed(AppRoute.forceUpdateScreen.name);
  }

  @override
  ProgramStart get startType => ProgramStart.forceUpdate;
}

class RouteApp {
  late Route _route;

  RouteApp({required ProgramStart startType}) {
    setRoute(startType);
  }

  Route get route => _route;

  void setRoute(ProgramStart startType) => _route = Route.init(startType);

  void execute(BuildContext context) {
    route.execute(context);
  }
}

enum ProgramStart {
  firstLaunch('First_Launch'),
  loggedOut('Logged_Out'),
  loggedIn('Logged_In'),
  otaUpdate('Logged_Out'),
  forceUpdate('Logged_Out');

  const ProgramStart(this.state);

  final String state;
}

extension String2Enum on String {
  ProgramStart get launchState {
    return ProgramStart.values.firstWhere((element) => element.state == this,
        orElse: () => ProgramStart.firstLaunch);
  }
}

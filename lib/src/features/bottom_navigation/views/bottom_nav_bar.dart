import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/src/features/bottom_navigation/controller/base_nav_controller.dart';
import 'package:traly/src/features/bottom_navigation/widgets/nav_bar_widget.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/theme/color/color_scheme.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final bottomNavCtrl = ref.watch(bottomNavController);
    return Scaffold(
      key: bottomNavCtrl.scaffoldkey,
      body: Stack(children: [
        bottomNavCtrl.dashBoardList[bottomNavCtrl.selectedIndex],
        Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 30),
                child: Container(
                  padding: TralyConstants.smallSpaceXX.w.hEdgeInsets,
                  height: 84.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whites.withValues(alpha: .2),
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(
                        color: AppColors.whites.withValues(alpha: .2),
                        width: 1.w),
                  ),
                  child: const Center(
                    child: NavBarTile(),
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}

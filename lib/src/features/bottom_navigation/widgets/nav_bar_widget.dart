import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/features/bottom_navigation/controller/base_nav_controller.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';

class NavBarTile extends ConsumerStatefulWidget {
  const NavBarTile({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavBarTileState();
}

class _NavBarTileState extends ConsumerState<NavBarTile> {
  @override
  Widget build(BuildContext context) {
    final bottomNavCtrl = ref.watch(bottomNavController);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 60.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarWidget(
            onTap: () => bottomNavCtrl.changeIndex(0),
            icon: Assets.vectors.home,
            label: 'Home',
            gradient: bottomNavCtrl.selectedIndex == 0
                ? LinearGradient(colors: [
                    AppColors.primary.shade400,
                    AppColors.secondary.shade500,
                  ])
                : LinearGradient(colors: [
                    AppColors.whites.withValues(alpha: .1),
                    AppColors.whites.withValues(alpha: .1),
                  ]),
          ),
          NavBarWidget(
            onTap: () => bottomNavCtrl.changeIndex(1),
            icon: Assets.vectors.clean,
            label: 'Clean',
            gradient: bottomNavCtrl.selectedIndex == 1
                ? LinearGradient(colors: [
                    AppColors.primary.shade400,
                    AppColors.secondary.shade500,
                  ])
                : LinearGradient(colors: [
                    AppColors.whites.withValues(alpha: .1),
                    AppColors.whites.withValues(alpha: .1),
                  ]),
          ),
          NavBarWidget(
            onTap: () => bottomNavCtrl.changeIndex(2),
            icon: Assets.vectors.rewards,
            label: 'Rewards',
            gradient: bottomNavCtrl.selectedIndex == 2
                ? LinearGradient(colors: [
                    AppColors.primary.shade400,
                    AppColors.secondary.shade500,
                  ])
                : LinearGradient(colors: [
                    AppColors.whites.withValues(alpha: .1),
                    AppColors.whites.withValues(alpha: .1),
                  ]),
          ),
          NavBarWidget(
            onTap: () => bottomNavCtrl.changeIndex(3),
            icon: Assets.vectors.leaderboard,
            label: 'Leaderboard',
            gradient: bottomNavCtrl.selectedIndex == 3
                ? LinearGradient(colors: [
                    AppColors.primary.shade400,
                    AppColors.secondary.shade500,
                  ])
                : LinearGradient(colors: [
                    AppColors.whites.withValues(alpha: .1),
                    AppColors.whites.withValues(alpha: .1),
                  ]),
          ),
          NavBarWidget(
            onTap: () => bottomNavCtrl.changeIndex(4),
            icon: Assets.vectors.settings,
            label: 'Settings',
            gradient: bottomNavCtrl.selectedIndex == 4
                ? LinearGradient(colors: [
                    AppColors.primary.shade400,
                    AppColors.secondary.shade500,
                  ])
                : LinearGradient(colors: [
                    AppColors.whites.withValues(alpha: .1),
                    AppColors.whites.withValues(alpha: .1),
                  ]),
          )
        ],
      ),
    );
  }
}

class NavBarWidget extends ConsumerWidget {
  final SvgGenImage icon;
  final LinearGradient? gradient;
  final String label;
  final void Function()? onTap;
  const NavBarWidget({
    super.key,
    required this.icon,
    this.gradient,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, gradient: gradient
                      // color: AppColors.whites.withOpacity(.2)
                      ),
              child: icon.svg(
                  color: AppColors.whites, height: 25.w, fit: BoxFit.scaleDown),
            ),
            //PHConstants.smallSpace.h.vSpace,
            Text(
              label,
              textAlign: TextAlign.center,
              style:
                  context.labelLarge?.regular.copyWith(color: AppColors.whites),
            ),
          ],
        ),
      ),
    );
  }
}

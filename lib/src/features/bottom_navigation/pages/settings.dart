import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/features/bottom_navigation/widgets/settings_widget.dart';
import 'package:traly/src/features/settings/screens/settings_screen.dart';
import 'package:traly/src/routing/routing.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/shared/utils/app_texts.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            AppColors.primary.shade800,
            AppColors.primary.shade700,
            AppColors.primary.shade800,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: SafeArea(
          child: Padding(
            padding: TralyConstants.mediumSpaceM.w.hEdgeInsets,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TralyConstants.mediumSpaceM.h.vSpace,
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 3.w,
                              color: AppColors.secondary.shade400,
                            )),
                        child: Assets.images.myAvatar.image(fit: BoxFit.cover),
                      ),
                      TralyConstants.mediumSpace.h.vSpace,
                      Text(
                        AppTexts.userName,
                        style: context.titleSmall?.semiBold,
                      ),
                      Text(
                        'sammyaa@gmail.com',
                        style: context.bodySmall?.regular.copyWith(
                          color: AppColors.whites.withValues(alpha: .7),
                        ),
                      ),
                    ],
                  ),
                ),
                TralyConstants.mediumSpace.h.vSpace,
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TralyConstants.smallSpaceXX.h.vSpace,
                      Text(
                        AppTexts.account,
                        style: context.bodyMedium?.medium,
                      ),
                      TralyConstants.smallSpaceX.h.vSpace,
                      SettingsWidget(
                          icon: Assets.vectors.profile,
                          text: AppTexts.editProfile),
                      TralyConstants.smallSpaceX.h.vSpace,
                      SettingsWidget(
                          icon: Assets.vectors.notifs, text: AppTexts.notifs),
                      TralyConstants.smallSpaceX.h.vSpace,
                      TralyConstants.bigSpace.h.vSpace,
                      Text(
                        AppTexts.inbox,
                        style: context.bodyMedium?.medium,
                      ),
                      TralyConstants.smallSpaceX.h.vSpace,
                      SettingsWidget(
                          icon: Assets.vectors.connected,
                          text: AppTexts.connectedAccs),
                      TralyConstants.smallSpaceX.h.vSpace,
                      SettingsWidget(
                          icon: Assets.vectors.filters, text: AppTexts.filters),
                      TralyConstants.smallSpaceX.h.vSpace,
                      SettingsWidget(
                          icon: Assets.vectors.senders,
                          text: AppTexts.safeSenders),
                      TralyConstants.bigSpace.h.vSpace,
                      Text(
                        AppTexts.rewards,
                        style: context.bodyMedium?.medium,
                      ),
                      TralyConstants.smallSpaceX.h.vSpace,
                      SettingsWidget(
                          icon: Assets.vectors.premiumStar,
                          text: AppTexts.pointsHistory),
                      TralyConstants.smallSpaceX.h.vSpace,
                      SettingsWidget(
                          icon: Assets.vectors.giftCard,
                          text: AppTexts.redemptions),
                      TralyConstants.bigSpace.h.vSpace,
                      Text(
                        AppTexts.app,
                        style: context.bodyMedium?.medium,
                      ),
                      TralyConstants.smallSpaceX.h.vSpace,
                      SettingsWidget(
                          icon: Assets.vectors.customTheme,
                          text: AppTexts.pointsHistory),
                      TralyConstants.smallSpaceX.h.vSpace,
                      SettingsWidget(
                          icon: Assets.vectors.about, text: AppTexts.about),
                      TralyConstants.bigSpace.h.vSpace,
                      Text(
                        AppTexts.achievements,
                        style: context.bodyLarge?.medium,
                      ),
                      TralyConstants.smallSpaceX.h.vSpace,
                      SettingsWidget(
                          onTap: () {
                            context.pushNamed(AppRoute.settings.name,
                                pathParameters: {
                                  "page": SettingsPage.yourBadges.name,
                                });
                          },
                          icon: Assets.vectors.badge,
                          text: AppTexts.badges),
                      TralyConstants.ctaIconSize.h.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.vectors.signOut.svg(width: 20.w),
                          Text(
                            AppTexts.signOut,
                            style: context.bodyMedium?.medium.copyWith(
                              color: const Color(0xFFFF6B8B),
                            ),
                          ),
                        ],
                      ),
                      TralyConstants.ctaIconSize.h.vSpace,
                      TralyConstants.appBarHeight.h.vSpace,
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/features/bottom_navigation/widgets/achievement_widget.dart';
import 'package:traly/src/features/settings/widgets/achievement_circle.dart';
import 'package:traly/src/features/settings/widgets/inbox_zero_pop_up.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/shared/utils/app_texts.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({
    super.key,
  });

  @override
  State<AchievementsPage> createState() => _BadgesPageState();
}

class _BadgesPageState extends State<AchievementsPage> {
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TralyConstants.mediumSpaceM.h.vSpace,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: InkWell(
                        onTap: ()=> Navigator.pop(context),
                        child: Container(
                          width: 38.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: .15),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: .2),
                              //width: 1.5,
                            ),
                          ),
                          child: Icon(Icons.arrow_back_ios_new,
                              color: AppColors.whites.withValues(alpha: 0.5),
                              size: 20.w),
                        ),
                      ),
                    )),
                Text(
                  AppTexts.achievements,
                  style: context.titleSmall?.semiBold,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: 75.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 13.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: .1),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                              color: AppColors.whites.withValues(alpha: 0.5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Assets.vectors.achieve.svg(),
                          Text(
                            AppTexts.pointsNum,
                            style: context.labelLarge?.medium.copyWith(
                                color: AppColors.whites.withValues(alpha: 0.5)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
              TralyConstants.mediumSpaceX.h.vSpace,
              Expanded(
                  child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TralyConstants.smallSpace.h.vSpace,
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InboxZeroPopUp(),
                            ),
                          );
                        },
                        child: const AchievementCircle(
                            progress: 2 / 5, subtitle: '2/5 days'),
                      ),
                    ),
                    TralyConstants.bigSpaceX.h.vSpace,
                    Text(
                      AppTexts.yourBadges,
                      style: context.bodyLarge?.medium,
                    ),
                    TralyConstants.mediumSpaceX.h.vSpace,
                    CustomScrollView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.zero,
                            sliver: SliverGrid.count(
                              crossAxisCount: 3,
                              crossAxisSpacing: 26.w,
                              mainAxisSpacing: 16.h,
                              childAspectRatio: 0.95,
                              children: [
                                YourBadge(
                                  icon: Assets.vectors.light,
                                  text: 'Fast Responder',
                                  greaterThanTWo: false,
                                ),
                                YourBadge(
                                  icon: Assets.vectors.mark,
                                  text: AppTexts.inboxZero,
                                  greaterThanTWo: false,
                                ),
                                YourBadge(
                                  icon: Assets.vectors.spam,
                                  text: AppTexts.spamSlayer,
                                  greaterThanTWo: false,
                                ),
                                YourBadge(
                                  icon: Assets.vectors.organizer,
                                  text: AppTexts.organizerPro,
                                ),
                                YourBadge(
                                  icon: Assets.vectors.clean,
                                  text: 'Clean Sweep',
                                ),
                                YourBadge(
                                  icon: Assets.vectors.premiumStar,
                                  text: 'VIP Connector',
                                ),
                                YourBadge(
                                  icon: Assets.vectors.clean,
                                  text: 'Email Master',
                                ),
                                YourBadge(
                                  icon: Assets.vectors.quickReply,
                                  text: AppTexts.quickReply,
                                ),
                                YourBadge(
                                  icon: Assets.vectors.moon,
                                  text: 'Night Owl',
                                ),
                              ],
                            ),
                          ),
                        ]),
                    TralyConstants.bigSpaceX.vSpace,
                    Text(
                      AppTexts.achievements,
                      style: context.bodyLarge?.semiBold,
                    ),
                    TralyConstants.mediumSpace.h.vSpace,
                    const AchievementWidget(),
                    TralyConstants.ctaIconSize.h.vSpace,
                    TralyConstants.appBarHeight.h.vSpace,
                  ],
                ),
              )),
            ]),
          ),
        ),
      ),
    );
  }
}

class YourBadge extends StatelessWidget {
  final SvgGenImage icon;
  final String text;
  final bool? greaterThanTWo;
  final bool? showText;
  const YourBadge(
      {super.key,
      required this.icon,
      required this.text,
      this.greaterThanTWo = true,
      this.showText = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      height: 114.h,
      child: Column(children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
                padding: EdgeInsets.all(16.w),
                width: 90.w,
                height: 90.h,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .15),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .2),
                  ),
                ),
                child: Container(
                  width: 64.w,
                  height: 64.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: greaterThanTWo == true
                        ? LinearGradient(colors: [
                            AppColors.whites.withValues(alpha: .001),
                            AppColors.whites.withValues(alpha: .001),
                          ])
                        : LinearGradient(colors: [
                            AppColors.primary.shade400,
                            AppColors.secondary.shade500,
                          ]),
                  ),
                  child: icon.svg(height: 32.h, fit: BoxFit.scaleDown),
                )),
          ),
        ),
        // TralyConstants.smallSpace.h.vSpace,
        showText == true
            ? Text(text,
                style: context.labelLarge?.regular.copyWith(
                  color: AppColors.whites.withValues(alpha: 0.9),
                ))
            : const SizedBox.shrink(),
        // TralyConstants.smallSpace.h.vSpace,
      ]),
    );
  }
}

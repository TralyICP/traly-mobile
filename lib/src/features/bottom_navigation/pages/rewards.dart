import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/features/bottom_navigation/widgets/reward_widget.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/shared/utils/app_texts.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class Rewards extends ConsumerStatefulWidget {
  const Rewards({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RewardsState();
}

class _RewardsState extends ConsumerState<Rewards> {
  // final bookingsCategory = [
  //   AppTexts.ongoing,
  //   AppTexts.upcoming,
  //   AppTexts.completed,
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
          child: Padding(
            padding: TralyConstants.mediumSpaceM.w.hEdgeInsets,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TralyConstants.mediumSpaceM.h.vSpace,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppTexts.rewards,
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
                                  color: Colors.white.withValues(alpha: .15),
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                      color: AppColors.whites
                                          .withValues(alpha: 0.5))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Assets.images.stars.image(),
                                  Text(
                                    AppTexts.pointsNum,
                                    style: context.labelLarge?.medium.copyWith(
                                        color: AppColors.whites
                                            .withValues(alpha: 0.5)),
                                  )
                                ],
                              ),
                            ),
                          ))
                    ]),
                TralyConstants.mediumSpaceM.h.vSpace,
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TralyConstants.bigSpace.h.vSpace,
                      Container(
                        padding: TralyConstants.mediumSpaceX.w.hEdgeInsets,
                        width: 1.sw,
                        height: 194.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary.shade700,
                          borderRadius: BorderRadius.circular(30.r),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFB96BF3)
                                  .withValues(alpha: 0.3),
                              spreadRadius: 4,
                              blurRadius: 2,
                              offset: const Offset(
                                  3, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TralyConstants.mediumSpaceX.h.vSpace,
                            Text(
                              AppTexts.yourPoints,
                              style: context.bodyMedium?.medium,
                            ),
                            Text(
                              AppTexts.pointsNum,
                              style: context.headlineLarge?.bold,
                            ),
                            TralyConstants.mediumSpace.h.vSpace,
                            Row(
                              children: [
                                CircleAvatar(
                                  maxRadius: 30.r,
                                  //  minRadius: 54.r,
                                ),
                                // CircularProgressIndicator(

                                // ),
                                TralyConstants.mediumSpace.w.hSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${150} points until',
                                      style: context.bodySmall?.regular,
                                    ),
                                    Text(
                                      AppTexts.nextReward,
                                      style: context.bodySmall?.regular,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      TralyConstants.mediumSpaceX.h.vSpace,
                      Text(
                        AppTexts.availableRewards,
                        style: context.bodyLarge?.medium,
                      ),
                      TralyConstants.mediumSpace.h.vSpace,
                      Row(
                        children: [
                          RewardWidget(
                              icon: Assets.vectors.giftCard,
                              title: r'Gift Card $5',
                              points: '5,000'),
                          TralyConstants.smallSpaceXX.w.hSpace,
                          RewardWidget(
                              icon: Assets.vectors.premiumStar,
                              title: 'Premium Month',
                              points: '8,000'),
                        ],
                      ),
                      TralyConstants.mediumSpace.h.vSpace,
                      Row(
                        children: [
                          RewardWidget(
                              icon: Assets.vectors.iconPack,
                              title: 'Icon Pack',
                              points: '3,000'),
                          TralyConstants.smallSpaceXX.w.hSpace,
                          RewardWidget(
                              icon: Assets.vectors.customTheme,
                              title: 'Custom Theme',
                              points: '4,500'),
                        ],
                      ),
                      TralyConstants.mediumSpace.h.vSpace,
                      Row(
                        children: [
                          RewardWidget(
                              icon: Assets.vectors.stars,
                              title: 'Bonus Features',
                              points: '7,500'),
                          TralyConstants.smallSpaceXX.w.hSpace,
                          RewardWidget(
                            icon: Assets.vectors.headPhones,
                            title: 'Priority Support',
                            points: '2,000',
                          ),
                        ],
                      ),
                      TralyConstants.mediumSpaceX.h.vSpace,
                      Text(
                        AppTexts.recentRedemptions,
                        style: context.bodyLarge?.medium,
                      ),
                      TralyConstants.mediumSpace.h.vSpace,
                      const RedemptionWidget(),
                      TralyConstants.ctaIconSize.h.vSpace,
                      TralyConstants.bigSpaceX.h.vSpace,
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

class RedemptionWidget extends StatelessWidget {
  const RedemptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 1.sw,
            height: 190.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.whites.withValues(alpha: .2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFB96BF3).withValues(alpha: 0.3),
                  spreadRadius: 4,
                  blurRadius: 3,
                  offset: const Offset(3, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.vectors.stars.svg(
                  width: 30.w,
                ),
                TralyConstants.mediumSpace.h.vSpace,
                Text(
                  'No ${AppTexts.recentRedemptions.toLowerCase()}.',
                  style: context.bodyMedium?.regular.copyWith(
                    color: AppColors.whites.withValues(alpha: .6),
                  ),
                ),
                TralyConstants.tinySpace.h.vSpace,
                Text(
                  AppTexts.rewardsWillAppear,
                  style: context.bodySmall?.regular,
                ),
              ],
            ),
          ),
        ));
  }
}

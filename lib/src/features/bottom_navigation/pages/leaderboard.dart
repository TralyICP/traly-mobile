import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traly/gen/assets.gen.dart';
import 'package:traly/src/shared/constants.dart';
import 'package:traly/src/shared/extensions/spacing_ext.dart';
import 'package:traly/src/shared/utils/app_texts.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/typography/fontweight_ext.dart';
import 'package:traly/src/theme/typography/typography_extension_on_context.dart';

class LeaderBoard extends ConsumerStatefulWidget {
  const LeaderBoard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends ConsumerState<LeaderBoard> {
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
                      children: [
                        TralyConstants.mediumSpaceM.h.vSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppTexts.leaderBoard,
                              style: context.titleSmall?.semiBold,
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        width: 75.w,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 13.w,
                                          vertical: 8.h,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                                .withValues(alpha: .15),
                                            borderRadius:
                                                BorderRadius.circular(16.r),
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
                                              style: context.labelLarge?.medium
                                                  .copyWith(
                                                      color: AppColors.whites
                                                          .withValues(
                                                              alpha: 0.5)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                                    TralyConstants.mediumSpace.w.hSpace,
                                Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        AppColors.primary.shade400,
                                        AppColors.secondary.shade500,
                                      ], stops: const [
                                        .4,
                                        1.0,
                                      ]),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2.w,
                                      )),


                                  child: Assets.images.myAvatar.image(),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )))));
  }
}
